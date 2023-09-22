#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 input_file"
  exit 1
fi

input_file="$1"
output_file="filtered_output.csv"

# Use grep to filter lines ending with "e+02" and save them to the output file
grep "e+02$" "$input_file" > "$output_file"

echo "Filtered lines saved to $output_file"

