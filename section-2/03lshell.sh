#!/bin/bash

# using while lopp to display the parameter or arguments
# using shift command to replace their position

echo "Outside the while loop ......"
echo
echo "Positional Parameter (1) : $1"
echo "Positional Parameter (2) : $2"
echo "Positional Parameter (3) : $3"
echo

echo "Inside the while loop ......"
echo

while [ "$#" -gt 0 ]; do
    echo "Positional Parameter (1) : $1"
    echo "Positional Parameter (2) : $2"
    echo "Positional Parameter (3) : $3"
    echo
    shift
done
