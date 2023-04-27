#! /bin/bash

# list_functions_in_script.sh gives the list of functions in a script

# SYNOPSIS : list_functions_in_script.sh <script_name>

function list_functions() {
  local FILENAME=$1
  local FUNCTION_NAMES=$(cat $FILENAME | grep -o "^function .*()" | grep -o " .*()")

  echo -e "$FUNCTION_NAMES"
}

list_functions $1
