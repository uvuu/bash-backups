#!/bin/bash

DIR='' # Directory where we store the packed files
if [ -n "$1" ]; then
DIR=$1
fi

TIME=''
if [ -n "$2" ]; then
TIME=.$2
fi

# Put here separate files for archiving(archives will have prefix F_) 
FILES=(
 "backup.sh"
)

# Put directories here for non-recursive archiving(archives will have prefix NR_)
NON_RECURSIVE=(
 "/root/backups"
)

# Put directories here for recursive archiving(archives will have prefix R_)
RECURSIVE=(
)

# Pack backuping stuff
#find . -maxdepth 1 -type f -exec tar cvfz $DIR/backup_scripts.tar.gz {} +

ARCHIVE=''

for path in ${FILES[@]}; do
  ARCHIVE="F$(realpath $path | tr / _)"
  tar cvfz "$DIR/$ARCHIVE$TIME.tar.gz" $path
done

for path in ${NON_RECURSIVE[@]}; do
  ARCHIVE="NR$(realpath $path | tr / _)"
  find $path -maxdepth 1 -type f -exec tar cvfz "$DIR/$ARCHIVE$TIME.tar.gz" {} +
done

for path in ${RECURSIVE[@]}; do
  ARCHIVE="R$(realpath $path | tr / _)"
  tar cvfz "$DIR/$ARCHIVE$TIME.tar.gz" $path
done
