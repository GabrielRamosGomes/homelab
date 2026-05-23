#!/bin/bash

CHECK_PATH="$1"

if [ -z "$CHECK_PATH" ]; then
  exit 1
fi

if [ -e "$CHECK_PATH" ]; then
  exit 0
else
  exit 1
fi