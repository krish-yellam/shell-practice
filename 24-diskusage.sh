#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

logs(){
    echo "$(date "+%Y-%m-%d %H:%M:%S") | $1" | tee $LOGS_FILE
}

DISK_USAGE=$(df -t | grep -v filesystem)
USAGE_THRESHOLD=3

while IFS= read -r line
    do
        USAGE=$(df -hT | grep -v filesystem | awk '{print $3}' | cut -d "%" -f1)
        PARTITION=$(df -ht )
        if [ "$DISK_USAGE" -gt "$USAGE_THRESHOLD" ]; then



    done <<< "$DISK_USAGE"
    