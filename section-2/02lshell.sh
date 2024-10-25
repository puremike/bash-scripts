#!/bin/bash

# Display the path and filename of the script
echo "Full path of running script: $0"
echo "Here is the path $(dirname $0) of the $(basename $0) file"

# Display the number of argument(s) passed in the command
NUMBER_ARGS=$#
echo "Usage: $NUMBER_ARGS argument(s) was provided [OPTION] [OPTION]"

# Check if argument(s) passed in the command
if [[ "$NUMBER_ARGS" -lt 1 ]]; then
    echo "No arguments was provided"
    exit 1
fi

# use for loops to create passwords for the users (entered as arguments)
for USER in $@; do
    PASSWORD=$(date +%s%N | shasum | head -c8)
    echo "$USER:$PASSWORD"
done
