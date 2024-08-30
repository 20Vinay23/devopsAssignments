#!/bin/bash

# Check if the user provided an argument
if [ -z "$1" ]; then
  echo "Enter a filename"
  echo "Usage: $0 <path>"
  exit 1
fi

# Store the argument (path) in a variable
path="$1"

# Extract the filename from the provided path
filename=$(basename "$path")

# Check if the provided path is a directory
if [ -d "$path" ]; then
  echo "$path is a directory, not a file."
  exit 1
fi

# Check if the file exists and is a regular file
if [ ! -f "$path" ]; then
  echo "File $path does not exist."
  exit 1
fi

# Read the file line by line
while IFS= read -r line; do
  # Get the length of the line using wc
  length=$(echo -n "$line" | wc -c)
  echo "Number of characters in line: $length"
done < "$path"

