#!/bin/bash

# Get the two input numbers
input1=$1
input2=$2

# Define output file
output_file="HPL_params.csv"

# Check if the input numbers are valid
if [ "$input1" -eq 0 ] || [ "$input2" -eq 0 ]; then
  echo "Invalid input. Both input numbers must be greater than 0."
  exit 1
fi

# Print all multiples of input1 up to input2
for i in $(seq 0 $input2); do
  if [ $((i % input1)) -eq 0 ]; then
    echo $i >> "$output_file"
  fi
done

