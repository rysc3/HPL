#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 input.csv"
  exit 1
fi

input_file="$1"
output_file="output.txt"

if [ ! -f "$input_file" ]; then
  echo "Input file not found: $input_file"
  exit 1
fi

awk -F',' '{
  split($2, a, "e")
  for (i = 1; i <= NF; i++) {
    data[i][NR] = (i == 2) ? a[1] : $i
  }
}
END {
  n = length(data[1])
  for (i = 1; i <= n; i++) {
    for (j = 1; j <= n; j++) {
      if (data[1][j] > data[1][j + 1]) {
        for (k = 1; k <= NF; k++) {
          temp = data[k][j]
          data[k][j] = data[k][j + 1]
          data[k][j + 1] = temp
        }
      }
    }
  }
  for (i = 1; i <= NF; i++) {
    for (j = 1; j <= NR; j++) {
      printf "%s%s", data[i][j], (j == NR) ? "\n" : ","
    }
  }
}' "$input_file" > "$output_file"

echo "Reformatted and sorted data saved to $output_file"

