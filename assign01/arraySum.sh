#!/bin/bash

# Ask the user for the size of the array
echo "Enter the size of the array:"
read -r size

# Check if the size is a positive integer
if ! [[ "$size" =~ ^[0-9]+$ ]] || [ "$size" -le 0 ]; then
  echo "Invalid size. Please enter a positive integer."
  exit 1
fi

# Initialize an array to store the elements
declare -a array

# Ask the user to input the elements of the array
echo "Enter $size elements:"
for (( i=0; i<size; i++ )); do
  read -r element
  array[i]=$element
done

# Calculate the sum of the elements
sum=0
for num in "${array[@]}"; do
  sum=$((sum + num))
done

# Display the result
echo "The sum of the array elements is: $sum"
