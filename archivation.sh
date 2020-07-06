#!/bin/bash

DIR='~/backups/archives' # Directory where we store the packed files
if [ -n "$1" ]; then
DIR=$1
fi

TIME=''
if [ -n "$2" ]; then
TIME=$2
fi

# Put here separate files for archiving(archives will have prefix F_) 
FILES=(
 "/etc/apache2/sites-available/thewayfarer.xyz.conf"
)

# Put directories here for non-recursive archiving(archives will have prefix NR_)
NON_RECURSIVE=(
 "/root/backups" # Pack backuping stuff itself
 "/root/backups/dumps"
)

# Put directories here for recursive archiving(archives will have prefix R_)
RECURSIVE=(
 "/var/www/html"
)

ARCHIVE=''

for path in ${FILES[@]}; do
  ARCHIVE="F$(realpath $path | tr / _)"
  tar cvfz "$DIR/$ARCHIVE.$TIME.tar.gz" $path
done

for path in ${NON_RECURSIVE[@]}; do
  ARCHIVE="NR$(realpath $path | tr / _)"
  find $path -maxdepth 1 -type f -exec tar cvfz "$DIR/$ARCHIVE.$TIME.tar.gz" {} +
done

for path in ${RECURSIVE[@]}; do
  ARCHIVE="R$(realpath $path | tr / _)"
  tar cvfz "$DIR/$ARCHIVE.$TIME.tar.gz" $path
done
