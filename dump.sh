#!/bin/bash

DIR='~/backups/dumps' # Directory where we store the packed files
if [ -n "$1" ]; then
DIR=$1
fi

TIME=''
if [ -n "$2" ]; then
TIME=$2
fi

USER='root' # Set up mysql user name
PASSWORD='' # Set up password for the choosen user

# Put here databases for dumping
DATABASES=(
 'thewayfarer'
)

for database in ${DATABASES[@]}; do
   mysqldump --user=$USER --password=$PASSWORD $database > "$DIR/DB_$database.$TIME.dump"
done
