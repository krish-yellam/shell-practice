#!/bin/bash


USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="$LOGS_FOLDER/backup.log"
SCRIPTDIR=$PWD
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # 14 Days is the default

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root" 
    exit 1
fi

mkdir -p $LOGS_FOLDER

USAGE(){
echo -e "$R sudo backup <SOURCE_DIR> <DEST_DIR> <DAYS>[default 14 days] $N"
 
}

if [ $# -lt 2 ]; then
    USAGE
fi
 
logs(){
    echo "$(date "+%Y-%m-%d %H:%M:%S") | $1" | tee $LOGS_FILE
}
    

if [ ! -d $SOURCE_DIR ]; then
    echo "Source directory: $SOURCE_DIR doesnot exist"
    exit 1
fi

if [ ! -d $DEST_DIR ]; then
    echo "Destination directory: $DEST_DIR doesnot exist"
    exit 1
fi


FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

logs "Backup started"
logs "Source directory: $SOURCE_DIR"
logs "Destination directory: $DEST_DIR"
logs "Number of Days: $DAYS"

if [ -z $FILES ]; then
    logs "No files to archieve"
else 
    # app-logs -$timestamp.zip
    logs "files found to archieve: $FILES"
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE_NAME=$DEST_DIR/app-logs-$TIMESTAMP.zip
    echo -e "Archieve name $ZIP_FILE_NAME  $Y skipping $N"
    tar -zcvf $ZIP_FILE_NAME $FILES  
    
        if [ -f $ZIP_FILE_NAME ]; then
            logs -e "Archieved  $G success $N"
           
            while IFS= read -r filepath
            do 
                echo "Files to delete: $filepath"
                rm -r $filepath
                echo "Deleted files was: $filepath"

            done <<< $FILES
        else
            logs -e "Archieved $R Failure $N"
            exit 1
        fi
fi
