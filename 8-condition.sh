#!/bin/bash

 NUMBER=$1

 if [ $NUMBER -gt 20 ]; then
echo "Given number : $NUMBER is greater than 20"
 
 elif [ "$NUMBER" -eq 20 ]; then
 echo "Given no : $NUMBER IS Equal to 20"

else 
echo "Given number : $NUMBER is less than 20"

fi
