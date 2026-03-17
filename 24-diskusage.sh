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
        USAGE=$(df -hT | grep -v filesystem | awk '{print $6}' | cut -d "%" -f1)
        PARTITION=$(df -hT | grep -v filesystem | awk '{print $7}' )
        
        if [ "$USAGE" -gt "$USAGE_THRESHOLD" ]; then
            MESSAGE+="High disk usage on $PARTITON:$USAGE"
        fi 
    done <<< "$DISK_USAGE"
    
    echo "$MESSAGE"