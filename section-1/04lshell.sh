#!/bin/bash

# This script will create an account on the local system
# You will prompted for the account name and password
# You need to run this script with root privileges

read -p "Enter the username to create user account: " USER_NAME
read -p "Enter your real name: " COMMENT
read -p "Enter the password to use for user account: " PASSWORD

# Create the user account
useradd -c "${COMMENT}" -m ${USER_NAME} # -m - create a home directory; -c - add a short description of the account

# Add a password for the user account
echo "${USER_NAME}:${PASSWORD}" | chpasswd

# Change your password after login
passwd -e "${USER_NAME}" # -e - force user to change the password at the next login
