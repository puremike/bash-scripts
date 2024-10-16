#!/bin/bash

# Display the UID and Username of the user
# Display if the user is "${USER}" or not

# Display the UID
echo "Your UID is ${UID}"

# Only display if the UID does not match 1000
UID_TO_TEST=1000

if [[ "${UID}" -ne "${UID_TO_TEST}" ]]; then
    echo "Your UID does not match ${UID_TO_TEST}"
    exit 1
fi

# Display the username
USERNAME="$(id -nu)"
echo "Your username is ${USERNAME}"

# Test if the command succeeded
# the "${?}" command is used to check the previous command used

if [[ "${?}" -ne 0 ]]; then
    echo "Command executed failed"
    exit 1
fi

# Check if the user is "scophee"
USERNAME_TO_TEST="scophee"

if [[ "${USERNAME}" == "${USERNAME_TO_TEST}" ]]; then
    echo "Your username match ${USERNAME_TO_TEST}"
else
    echo "Your username does not match ${USERNAME_TO_TEST}"
    exit 1
fi

exit 0 # ensure that my final exit code is 0 (success)
