#!/bin/bash

# Check if a file path argument is provided
if [ -z "$1" ]; then
  echo "File name is required"
  echo "Usage: $0 <file_path>"
  exit 1
fi

# Store the file path argument in a variable
file_path="$1"

# Extract the filename from the provided path
filename=$(basename "$file_path")

# Check if the file exists and is a regular file
if [ ! -f "$file_path" ]; then
  echo "File $file_path does not exist or is not a regular file."
  exit 1
fi

# Prompt the user for the pattern to search for
read -p "Enter the pattern to search for: " pattern

# Check if the file contains the pattern (case-insensitive search) and display the result
if grep -qi "$pattern" "$file_path"; then
  echo "The file $filename contains the pattern '$pattern'."
else
  echo "The file $filename does not contain the pattern '$pattern'."
fi
