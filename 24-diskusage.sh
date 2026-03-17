#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

logs(){
    echo "$(date "+%Y-%m-%d %H:%M:%S") | $1" | tee $LOGS_FILE
}

DISK_USAGE=$(df -hT | grep -v filesystem)
USAGE_THRESHOLD=3

while IFS= read -r line
    do
        USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
        PARTITION=$(echo $line | awk '{print $7}')
        
        if [ "$USAGE" -ge"$USAGE_THRESHOLD" ]; then
            MESSAGE+="High disk usage on $PARTITON:$USAGE"
        fi 
    done <<< "$DISK_USAGE"
    
    echo "$MESSAGE"