    #!/bin/bash

    USERID=$(id -u)
    LOGS_FOLDER="/var/log/shell-script"
    LOGS_FILES="/var/log/shell-script/$0.log"


    if [ $USERID -ne 0 ]; then
        echo "Try with root user" | tee -a $LOGS_FILES
        exit 1
    fi

    mkdir -p $LOGS_FOLDER

    VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo " $2 is failure" | tee -a $LOGS_FILES
        exit 1
    else 
        echo " $2 is success" | tee -a $LOGS_FILES
    fi

    }

    dnf install nginx -y &>> $LOGS_FILES
    VALIDATE $? Installing Nginx

    dnf install mysql -y &>> $LOGS_FILES
    VALIDATE $? Installing MYSQL

    dnf install nodejs -y &>> $LOGS_FILES
    VALIDATE $? Installing Nodejs