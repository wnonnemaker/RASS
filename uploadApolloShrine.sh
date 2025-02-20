#!/bin/bash

# Define the local file path and the remote server details

FILE_NAME=$(dmenu -p "Enter the file name to upload:" < /dev/null)

LOCAL_FILE="/home/will/codingProjects/Websites/hugo-apolloshrine/public/"
REMOTE_USER="root"
REMOTE_HOST="172.233.152.243"
REMOTE_PATH="/var/www/apolloshrine/"

# Upload the file using scp
scp "$LOCAL_FILE" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"

# Notify the user of success or failure
if [ $? -eq 0 ]; then
    notify-send "File Upload" "File uploaded successfully to $REMOTE_HOST"
else
    notify-send "File Upload" "Failed to upload file to $REMOTE_HOST"
fi
