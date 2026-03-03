#!/bin/bash

count=1

# while [ $count -le 5 ]
#     do 
#         echo "count is $count"
#         sleep 1
#         ((count++))
#     done


while IFS= read -r LINE
do
  # Process the current line (stored in the variable $LINE)
  echo "$LINE"
done <  20-newcommon.sh