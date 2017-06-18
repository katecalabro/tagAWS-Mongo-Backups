#!/bin/bash
S3_BUCKET="theangelettigroup"

aws s3api list-objects --bucket $S3_BUCKET --prefix 'mongo-backups/' --output table --query 'Contents[].{FileName: Key, Size: Size, LastModified: LastModified}'
