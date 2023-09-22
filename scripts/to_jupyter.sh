#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 input.csv"
  exit 1
fi

input_file="$1"
output_file="jupyter.txt"

if [ ! -f "$input_file" ]; then
  echo "Input file not found: $input_file"
  exit 1
fi

awk -F',' '{
  for (i = 1; i <= NF; i++) {
    a[i] = a[i] "," $i
  }
}
END {
  for (i = 1; i <= NF; i++) {
    sub(/^,/, "", a[i])
    print a[i]
  }
}' "$input_file" > "$output_file"

echo "Reformatted data saved to $output_file"

