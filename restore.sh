#! /bin/bash

# SYNOPSIS: restore.sh full_filename_to_restore destination_path

# restore.sh resotres the directory backed with the name

FILE_TO_RESTORE=$1
DESTINATION=$2

# Checking if the file exists in .BACKUP directory or not
# If present then restore it

if [ -e ~/.BACKUP/$FILE_TO_RESTORE ]; then
  tar xvfz ~/BACKUP/$FILE_TO_RESTORE -C $DESTINATION
  exit
fi

echo "restore.sh : File doesn't exists"
