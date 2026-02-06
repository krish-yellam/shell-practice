#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Try with root user"
    exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]; then
    echo " $2 is failure"
    exit 1
else 
    echo " $2 is success"
fi

}

dnf install nginx -y 
VALIDATE $? Installing Nginx

dnf install mysql -y 
VALIDATE $? Installing MYSQL

dnf install nodejs -y 
VALIDATE $? Installing Nodejs