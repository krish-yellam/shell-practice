#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/logs/shell-script"
LOG_FILES="/var/logs/shell-script/$0.log"

if [ $USERID -ne 0 ]; then
    echo "please run this script with rootuser access"
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE(){
if [ $1 -ne 0 ] then
    echo " $2 ..... FAILURE" | tee $LOG_FILES
    exit 1
else 
    echo "$2 ......SUCCESS" | tee $LOG_FILES
fi
}

for package in $@

do 
    dnf install $package -y &>>$LOG_FILES
    VALIDATE $? "$package installaion"
done