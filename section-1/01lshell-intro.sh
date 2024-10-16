#!/bin/bash

# Display 'Hello'
echo "Hello"

# Assign a value to a variable
WORD="script"

# Display the value of the variable
echo "The word is $WORD"

# Demonstrate that single quotes cause variables to not get expanded
echo '$WORD'

# Combine the variable with hard-coded text
echo "This is shell $WORD"

# Display the variable using alt syntax
echo "This is shell ${WORD}"

# Append text to the variable
echo "This is shell ${WORD}ing"

# Use a command substitution to display the length of the variable
echo "The length of the word is ${#WORD}"

# Create another variable
ENDING="ed"

# Combine the two variables
echo "This is ${WORD}${ENDING}"

# Reassign the variable
ENDING="ing"

echo "This is shell ${WORD}${ENDING}"
