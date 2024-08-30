#!/bin/bash

# Check if a directory path is provided as an argument, otherwise use the current directory
if [ -n "$1" ]; then
  target_directory="$1"
else
  target_directory="."
fi

# Check if the provided directory exists and is a directory
if [ ! -d "$target_directory" ]; then
  echo "Directory $target_directory does not exist or is not a directory."
  exit 1
fi

# Change to the target directory
cd "$target_directory" || exit

# Rename all .txt files to .html
for file in *.txt; do
  # Check if there are no .txt files
  if [ "$file" == "*.txt" ]; then
    echo "No .txt files found in $target_directory."
    exit 0
  fi

  # Rename the file
  mv "$file" "${file%.txt}.html"
  echo "Renamed $file to ${file%.txt}.html"
done
