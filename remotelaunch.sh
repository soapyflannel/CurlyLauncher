#!/bin/sh

# Input Xbox IP address
XBOX=""

# Remote Access Credentials
USER="xbox"
PASS="xbox"

# Insert App user model ID (AUMID) in Base64
APPID=""

# Fetch cookies
curl -k -s -u $USER:$PASS -c cookies.txt https://$XBOX:11443/ > /dev/null

# Extract CSRF token from cookies.txt
CSRF=$(awk '$6 == "CSRF-Token" { print $7 }' cookies.txt)

# Launch the app

curl -k -s -u $USER:$PASS -H "X-CSRF-Token: $CSRF" -b "CSRF-Token=$CSRF" -X POST -d "" "https://$XBOX:11443/api/taskmanager/app?appid=$APPID"
