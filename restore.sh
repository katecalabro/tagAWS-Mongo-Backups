#!/bin/bash
S3_BUCKET="theangelettigroup"

if [ -n "$1" ]; then
        echo "Downloading backup from s3 bucket..."
        aws s3api get-object --bucket $S3_BUCKET --key $1 backup.tar.gz
        echo "Creating restore-backup folder..."
        mkdir -p restore-backup
        echo "Unzipping backup tar..."
        tar xvzf backup.tar.gz -C ./restore-backup
        echo "Restoring to linked mongo database..."
        mongorestore ./restore-backup/dump
        echo "Cleaning up folders and tar..."
        rm -rf backup.tar.gz
        rm -rf ./restore-backup
        echo "Mongo Database Restored"
else
        echo "Please supple file from s3 you want to restore from. (use list.sh to view backups on the s3)"
        exit
fi
