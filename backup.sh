#!/bin/bash
MONGO_DB="theangelettigroup"
S3_BUCKET="theangelettigroup"
DATE_FORMAT="%H:%M"

FOLDER=/backup
DUMP_OUT=dump

FILE_NAME=$(date -u +$DATE_FORMAT).tar.gz

echo "Creating backup folder..."

rm -fr $FOLDER && mkdir -p $FOLDER && cd $FOLDER

echo "Starting backup..."

mongodump --db=$MONGO_DB --out=$DUMP_OUT --quiet

echo "Compressing backup..."

tar -zcvf ./$FILE_NAME $DUMP_OUT && rm -fr $DUMP_OUT

echo "Uploading to S3..."

aws s3api put-object --bucket $S3_BUCKET --key mongo-backups/$FILE_NAME --body ./$FILE_NAME

echo "Removing backup file..."

rm -f $FILE_NAME

echo "Done!"
