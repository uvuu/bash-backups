#!/bin/bash

TIME='' # Pass this value as first arg(e.g. real time, daily, weekly...)

if [ -n "$1" ]; then
TIME=$1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # Current script dir

DUMPS_DIR=$DIR/../dumps # Set up dumps folder
LOCAL_DIR=$DIR/../data # Set up local backup folder
if [ ! -d "$DUMPS_DIR" ]; then
  mkdir $DUMPS_DIR
fi 
if [ ! -d "$LOCAL_DIR" ]; then
  mkdir $LOCAL_DIR
fi

# Run dumping script
$DIR/dump.sh $DUMPS_DIR $TIME

# Run archiving script. Time is unnecessary arg here
$DIR/archivation.sh $LOCAL_DIR $TIME -A

# Run encriting script
#. encription.sh

REMOTE_DIR=backup_thewayfarer_xyz           # Set up remote backup foler

AUTH_DATA='--user name:pass'  # Set up auth data
WEBDAV_ADDRES='https://webdav.yandex.ru' # Set up webdav server URL

# Create folder
curl -X MKCOL $AUTH_DATA $WEBDAV_ADDRES/$REMOTE_DIR

# Upload all files from local folder
ls -f $LOCAL_DIR | xargs -I{} curl -T $LOCAL_DIR/{} $AUTH_DATA $WEBDAV_ADDRES/$REMOTE_DIR/{}
