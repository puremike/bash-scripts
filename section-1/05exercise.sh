#!/bin/bash

# Make sure the script is being executed with superuser privileges.
if [[ $UID -ne 0 ]]; then
    echo "You must be root to continue"
    exit 1
fi

# Get the username (login).
read -p "Enter username to create user account: " USER_NAME

# Get the real name (contents for the description field).
read -p "Enter real name for comment: " COMMENT

# Get the password.
read -sp "Enter password for user account: " PASSWORD

# check if username or password was provided - inputs validation
if [[ -z "$USER_NAME" || -z "$PASSWORD" ]]; then
    echo "Username or password cannot be empty"
    exit 1
fi

# Check if the user already exists.
if id "$USER_NAME" &>/dev/null; then
    echo "User '$USER_NAME' already exists."
    exit 1
fi

# Create the user with the password.
useradd -c "$COMMENT" -m "$USER_NAME"

# Check to see if the useradd command succeeded.
if [[ $? -ne 0 ]]; then
    echo "user creation failed"
    exit 1
fi

# Set the password.
echo "$USER_NAME:$PASSWORD" | chpasswd

# Check to see if the passwd command succeeded.
if [[ $? -ne 0 ]]; then
    echo "Password can't be set!"
    exit 1
fi

# Force password change on first login.
passwd -e "$USER_NAME"

# Display the username, password, and the host where the user was created.
echo
echo "Username: $USER_NAME"
echo "Password: $PASSWORD"
echo "Host: $HOSTNAME"

exit 0
