#!/bin/bash

# Display UID
echo "Your UID ${UID}"

# Display USER

USERNAME="${USER}"
USERN="$(id -nu)"

echo "Your Username is ${USERNAME}"
echo "Your Username is ${USERN}"

# Display USER is root or not

if [[ "${UID}" -eq 0 ]]; then
    echo "${USERNAME} is root"
else
    echo "${USERNAME} is not root"
fi

# Note:
# - You can use command "type <cmd-name>" to see if it's shell builtin or not.
# - You can use command "man <cmd-name>" to check the description of the cmd
# for example "man test"
