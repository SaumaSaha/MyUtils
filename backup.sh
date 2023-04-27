#! /bin/bash

# backup.sh will back up a folder 

# Name of the back-up file should be like this -> "file_name_ddmmyyyy_HHMM.tar.gz"

# SYNOPSIS : ./my_backup.sh folder name.

SOURCE=$1
DESTINATION=~/.BACKUP

# cutting the last part of SOURCE, will be used as file name for the archive file.
ARCHIVE=$(echo $SOURCE | sed "sX.*/\(.*\)X\1X")

TIMESTAMP=$(date "+%d%m%Y_%H%M")
ARCHIVE_FILENAME=$ARCHIVE\_$TIMESTAMP.tar.gz

tar cvfz $DESTINATION/$ARCHIVE_FILENAME -C $SOURCE . 
