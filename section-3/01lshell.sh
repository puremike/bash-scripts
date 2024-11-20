#!/bin/bash

# This script demonstrates Input/Output Redirection

# Redirect STDOUT to a file

FILE="/tmp/practdata"

echo "Hello Gophers" >$FILE
cat $FILE
echo

# Redirect STDOUT to a file while overwriting it
echo "Hello Gophers!" >$FILE
cat $FILE
echo

# Redirect STDOUT to a file while appending to it
echo "How is your Golang Journey going?" >>$FILE
cat $FILE
echo

echo $(date +%s%N | sha256sum | head -c10) >passwdeed
cat passwdeed
echo

echo $(date +%s%N | sha256sum | head -c10) >>passwdeed
cat passwdeed
echo

# Redirect STDIN from a file
read X <$FILE
echo "Input: $X"

# sudo chpasswd $USERNAME - change $USERNAME password to the one in passwdeed >passwdeed
