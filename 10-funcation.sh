#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access"
    exit 1
fi

      echo "Installing Nginx"
      dnf install nginx -y

if [ $? -ne 0 ]; then
      echo "Installing nginx ... FAILURE"
      exit 1
else 
    echo "Installing nginx ... SUCCESS"

fi

if

    echo "installing MYSQL"
    dnf install mysql -y

     [ $? -ne 0 ]; then
    echo "installing MSQL .... FAILED"
    exit 1

else 
    echo " installing MYSQL.... Sucesses

    if

    echo "installing nodejs"
    dnf install nodejs -y

     [ $? -ne 0 ]; then
    echo "installing NODEJS  .... FAILED"
    exit 1

else 
    echo "installing NODEJs.... Sucesses"