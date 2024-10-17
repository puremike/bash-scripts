#!/bin/bash

# Make sure the script is being executed with superuser privileges.
if [[ $UID -ne 0 ]]; then
    echo "You must be root to continue"
    exit 1
fi

# Get the username (login).
read -p "Enter username to create user account: " user_name

# Get the real name (contents for the description field).
read -p "Enter real name for comment: " comment

# Get the password.
read -p "Enter password for user account: " password

# Create the user with the password.
useradd -c "$comment" -m $user_name

# Check to see if the useradd command succeeded.
if [[ $? -eq 0 ]]; then
    echo "<useradd> command was successful"
else
    echo "<useradd> command failed!"
    exit 1
fi

# Set the password.
echo "$user_name:$password" | chpasswd

# Check to see if the passwd command succeeded.
if [[ $? -eq 0 ]]; then
    echo "<passwd> command was successful"
else
    echo "<passwd> command failed!"
    exit 1
fi

# Force password change on first login.
passwd -e $user_name

# Display the username, password, and the host where the user was created.
echo $'\n'
echo "Username: $user_name"
echo "Password: $password"
echo "Host: $(hostname)"
