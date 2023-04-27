#! /bin/bash

function style() {
  STRING=$1
  STYLE_CODE=$2
  echo -en "\033[${2}m${1}\033[0m"
}

function red() {
  STRING=$1
  style "$STRING" 31
}

function blue() {
  STRING=$1
  style "$STRING" 34
}

function green() {
  STRING=$1
  style "$STRING" 32
}

function cyan() {
  STRING=$1
  style "$STRING" 36
}

function underline() {
  STRING=$1
  style "$STRING" 4
}

function bold() {
  STRING=$1
  style "$STRING" 1
}

function blink() {
  STRING=$1
  style "$STRING" 5
}

