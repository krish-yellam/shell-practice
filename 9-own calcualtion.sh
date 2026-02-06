#!/bin/bash

NUMBER=$1

REMINDER=$((NUMBE%2))

if [ "$REMINDER" -eq 0 ]; then

echo "its even number"

else 

echo " odd number"

fi