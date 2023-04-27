#! /bin/bash

# SYNOPSIS: ./restore_backup.sh filename_to_restore destination_path 

# restore_backup.sh creates a direct(ory/oies) with "filename_timestamp" and restores archive file(s) which has the given filename in the specific directory

FILENAME_TO_RESTORE=$1
DESTINATION=$2
NUMBER_OF_FILE_FOUND=0

# Checking whether the second argument given is a directory or not.
if [ ! -d $DESTINATION ]; then
  echo "restore_backup.sh : Destination is not a directory" 
  exit
fi

# loop through the list of files in .BACKUP folder which has $FILENAME_TO_RESTORE as substring  in it 
for ARCHIVE_FILE in $(/bin/ls ~/.BACKUP | grep "$FILENAME_TO_RESTORE")
do
  DIRECTORY_NAME=$(echo "$ARCHIVE_FILE" | sed "s/\(.*\).tar.gz$/\1/") 
  mkdir $DESTINATION/$DIRECTORY_NAME 
  tar xvfz ~/.BACKUP/$ARCHIVE_FILE -C $DESTINATION/$DIRECTORY_NAME
  NUMBER_OF_FILE_FOUND=$(dc -e "$NUMBER_OF_FILE_FOUND 1 + p")
done

if [ $NUMBER_OF_FILE_FOUND -eq 0 ]; then
  echo "restore_backup.sh : No files found named $FILENAME_TO_RESTORE"
fi

