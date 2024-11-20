#!/bin/bash

# File Redirection

# File Descriptor 0 (FD 0) - STDIN
# File Descriptor 1 (FD 1) - STDOUT
# File Descriptor 2 (FD 2) - STDERR

# Redirection using STDOUT to a file

echo $(date +%s%N | sha256sum | head -c 10) 1>password.txt
cat password.txt
echo

echo $(date +%s%N | sha256sum | head -c 10) 1>>password.txt # while appending to the file
cat password.txt
echo

# Redirection using STDIN from a file
read LINE 0<password.txt # LINE acts as a variable location
echo "input: $LINE"

FILE="/tmp/practdata"

# Redirect first two line of /etc/passwd to the variable, FILE
head -n2 /etc/passwd 1>$FILE
cat $FILE
echo

# Redirect first two line of /etc/passwd to the variable, FILE while overwriting it
head -n2 /etc/passwd /etc/hosts 1>$FILE
cat $FILE
echo

# Redirect first three lines of /etc/passwd /etc/hosts /etc/fakefila STDOUT STDERR
head -n2 /etc/passwd /etc/hosts /etc/fakefile &>error.txt
echo "error.txt:"
cat error.txt
echo

# Redirect STDOUT and STDERR into /dev/null - doesn't output anything to the user
$(id -nu) &>/dev/null

rm /tmp/practdata password.txt error.txt
