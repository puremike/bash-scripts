#!/bin/bash

# A script that adds users to the same Linux system as the script is executed on - ENFORCING FILE REDIRECTIONS.

# Ensure the user has root priviledges

if [[ "$EUID" -ne 0 ]]; then
    echo "You must be root to continue" >&2
    exit 1
fi

# Check if the user supplied an account name on the command line as an argument

if [[ "$#" -lt 1 ]]; then
    echo "Usage: $0 USER_NAME [COMMENT]....." >&2
    echo "Create an account on the local system with the name of USER_NAME and a comment field of COMMENT" >&2
    exit 1
fi

USER_NAME="$1"

# Ensure the other arguments shift into the COMMENT FIELD
shift

COMMENT="$@"

# Check if the user/account name already exist
if id "$USER_NAME" &>/dev/null; then
    echo "User $USER_NAME already exist" >&2
    exit 1
fi

# Create the account_name
useradd -c "$COMMENT" -m "$USER_NAME" &>/dev/null

# Set the password for the account_name
PASSWORD=$(date +%s%N | sha256sum | head -c8)
echo "$USER_NAME:$PASSWORD" | chpasswd &>/dev/null

if [[ "$?" -ne 0 ]]; then
    echo "There was a problem creating the user account" >&2
    exit 1
fi

# Force the user to change password upon login
passwd -e "$USER_NAME" &>/dev/null

if [[ "$?" -ne 0 ]]; then
    echo "There was a problem forcing password change upon login" >&2
    exit 1
fi

# Display username, password and host
echo
echo "Login your account with the following credentials: "
echo "User: $USER_NAME"
echo "Password: $PASSWORD"
echo "Comment: $COMMENT (for documentation purpose. Not required to login)"
echo "Host: $HOSTNAME (for documentation purpose. Not required to login)"
echo

exit 0
