#!/bin/bash

TIME='' # Pass this value as first arg(e.g. real time, daily, weekly...)

if [ -n "$1" ]; then
TIME=.$1
fi

LOCAL_DIR=/root/backups/data # Set up local backup folder

# Run archiving script
. archivation.sh $LOCAL_DIR

# Run encriting script

REMOTE_DIR=backups           # Set up remote backup foler

AUTH_DATA='--user krash-5678:425484uvu'  # Set up auth data
WEBDAV_ADDRES='https://webdav.yandex.ru' # Set up webdav server URL

# Create folder
curl -X MKCOL $AUTH_DATA $WEBDAV_ADDRES/$REMOTE_DIR

# Upload all files from local folder
ls -f $LOCAL_DIR | xargs -I{} curl -T $LOCAL_DIR/{} $AUTH_DATA $WEBDAV_ADDRES/$REMOTE_DIR/{}
