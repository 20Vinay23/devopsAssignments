#!/bin/bash

# Check if a file path argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <file_path>"
  exit 1
fi

# Store the file path argument
file_path="$1"

# Extract the filename from the file path
filename=$(basename "$file_path")

# Check if the provided path is a directory
if [ -d "$file_path" ]; then
  echo "Error: $file_path is a directory. Please provide a file path."
  exit 1
fi

# Check if the file exists and is a regular file
if [ ! -f "$file_path" ]; then
  echo "File $file_path does not exist or is not a regular file."
  exit 1
fi

# Initialize an empty array to store lines
lines=()

# Read the file line by line and store each line in the array
while IFS= read -r line; do
  lines+=("$line")
done < "$file_path"

# Print the lines in reverse order
for (( i=${#lines[@]}-1; i>=0; i-- )); do
  echo "${lines[i]}"
done
