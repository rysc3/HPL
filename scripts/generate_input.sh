#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 <integer1> [<integer2> ...]"
  exit 1
fi

input_array=("$@")
output_file="output_params.csv"

# Create or truncate the output file
echo "Number,P,Q" > "$output_file"

for num in "${input_array[@]}"; do
  for p in {1..8}; do
    for q in {1..8}; do
      echo "$num,$p,$q" >> "$output_file"
    done
  done
done

echo "Output parameters saved to $output_file"

