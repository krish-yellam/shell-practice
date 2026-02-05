#!/bin/bash

START_TIME=$(date +%s)

echo "i started at now : $START_TIME"

sleep 5

echo " ok i do it again"

sleep 5

END_TIME=$(date +%s)

TOTAL_TIME=$(($END_TIME-$START_TIME))

echo " total time i spent : $TOTAL_TIME"