#! /bin/bash 

function is_file_in_pwd() {
  local FILE_NAME="$1"
  stat $FILE_NAME &> /dev/null
} 

function create_file() {
  local FILE_NAME=$1
  if ! is_file_in_pwd $FILE_NAME
  then
    echo "#! /bin/bash" > $1
    chmod +x $1
  fi

  vim $1
} 

function main() {
  local FILE_NAME=$1
  create_file $FILE_NAME
} 

main $1
