#! /bin/bash

source style.sh

function print_status() {
  local FILE_NAME=$1
  local CURRENT_MTIME=$2

  bold "$(red "$FILE_NAME ran at $CURRENT_MTIME")"
}

function auto_run() {
  local COMMAND=$1
  local FILE_NAME=$2
  local PREVIOUS_MTIME=$(date -r $FILE_NAME)

  while [ 1 ]
  do
    local CURRENT_MTIME=$(date -r $FILE_NAME)
    if [ "$CURRENT_MTIME" != "$PREVIOUS_MTIME" ];
    then
      clear
      $COMMAND $FILE_NAME
      PREVIOUS_MTIME="$CURRENT_MTIME"
      print_status $FILE_NAME "$CURRENT_MTIME"
    fi
    sleep 5
  done
}

auto_run $1 $2
