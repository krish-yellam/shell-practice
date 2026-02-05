#!/bin/bash

START-TIME=$(date +%s) 

echo "Script executed at :$START-TIME"

sleep 10

END-TIME=$(date +%s)

TOTAL_TIME=(($START-TIME-$END-TIME))

echo "total time :$TOTAL_TIME"
