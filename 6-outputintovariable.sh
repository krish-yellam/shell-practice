#!/bin/bash

START_TIME=$(date +%s) 

ech0o "Script executed at :$START_TIME"

sleep 10

END_TIME=$(date +%s)

TOTAL_TIME=(($START_TIME-$END_TIME))

echo "total time :$TOTAL_TIME"
