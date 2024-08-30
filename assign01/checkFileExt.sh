#!/bin/bash

# Check if the user provided an argument
if [ -z "$1" ]; then
  echo "file path required. Checkc the usage below:"
  echo "Usage: $0 <path>"
  exit 1
fi

# Store the argument in a variable
path="$1"

# Check if the path exists
if [ -e "$path" ]; then
  if [ -L "$path" ]; then
    echo "$path is a symbolic link."
  elif [ -f "$path" ]; then
    echo "$path is a regular file."
  elif [ -d "$path" ]; then
    echo "$path is a directory."
  else
    echo "$path exists, but it's not a regular file, directory, or symbolic link."
  fi
else
  echo "$path does not exist."
fi
