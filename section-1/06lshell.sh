#!/bin/bash

# A script that generates random password

# A random password
PASSWORD=$RANDOM
echo "$PASSWORD"

# A much longer random password
PASSWORD=$RANDOM$RANDOM$RANDOM$RANDOM
echo "$PASSWORD"

# A random password from date time
PASSWORD=$(date +%s)
echo "$PASSWORD"

# A much secure longer random password from date time: used seconds since the Epoch (1970-01-01) and nanoseconds
PASSWORD=$(date +%s%N)
echo "$PASSWORD"

# A even more secure random password using shasum
PASSWORD=$RANDOM
echo "$PASSWORD" | sha1sum | head -c40
echo

# A even more secure and safe random password
PASSWORD=$(date +%s%N | sha1sum | head -c8)
echo "$PASSWORD"

# A even more secure and safe password using random characters
ONE_CHAR=$(echo '!@#$%^&*()+~?' | fold -w1 | shuf | head -c1)
ONE_CHAR2=$(echo '!@#$%^&*()+~?' | fold -w2 | shuf | head -c2)
echo "$ONE_CHAR$PASSWORD"
echo "$PASSWORD$ONE_CHAR2"
