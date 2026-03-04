#!/bin/bash

LOGS_DIR=/home/ec2-user/app-logs
LOGS_FILE="$LOGS_DIR/$0.log"

if [ ! -d $LOGS_DIR ]; then
    echo "Directory does not exist"
    exit 1
fi

FILES_TO_DEL=$(find $LOGS_DIR -name "*.logs" -type f -mtime +14)
    echo "files to delete $FILES_TO_DEL" 

