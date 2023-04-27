#! /bin/bash

function kabab_to_camel_case() {
  STRING=$1
  for LOWERCHAR in $(echo $STRING | grep -o "[-]\w")
  do
    UPPERCASE=$(echo $LOWERCHAR | tr -d "-" | tr '[:lower:]' '[:upper:]')
    STRING=$(echo $STRING | sed "s/$LOWERCHAR/$UPPERCASE/g")
  done
  echo $STRING
}

