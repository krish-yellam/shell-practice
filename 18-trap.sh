#!/bin/bash

set -e #ERR

trap 'echo ""there is an error om $LINEN, Command: $BASH_COMMAND"' ERR

echo "Hello world"
echo "I am learning Shell"
echco "printing error here"
echo "no error in this"