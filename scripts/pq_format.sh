#!/bin/bash

# Input file path
input_file="HPL_results_debug.csv"

# Read the input file line by line
while IFS= read -r line; do
  # Split the line into fields using commas
  IFS=',' read -ra fields <<< "$line"

  # Extract the GFLOPS value and format it
  gflops="${fields[3]}"
  if [[ "$gflops" == *e+01 ]]; then
    gflops=$(echo "$gflops" | sed 's/e+01//')
    gflops="0.$gflops"
  else
    gflops=$(echo "$gflops" | sed 's/e.*//')
  fi

  # Append the formatted GFLOPS value to the data array
  data_array+=("$gflops")

done < "$input_file"

# Calculate the number of rows and columns for the 2D array
num_rows=8
num_columns=8

# Initialize the Python code
python_code="caption=\"Figure 4: Throughput for P and Q Process Grid Sizes.\"\n"
python_code+="# OPTIMAL NB = 160\n"
python_code+="P = [1,2,3,4,5,6,7,8]\n"
python_code+="Q = [1,2,3,4,5,6,7,8]\n"
python_code+="\n"
python_code+="throughput = np.array([\n"

# Populate the 2D array with the data
for ((i = 0; i < num_rows; i++)); do
  python_code+="  [${data_array[i*num_columns]}"
  for ((j = 1; j < num_columns; j++)); do
    index=$((i*num_columns + j))
    python_code+=", ${data_array[index]}"
  done
  python_code+="],\n"
done

# Remove the trailing comma and close the array
python_code=${python_code%,*}
python_code+="\n])\n"

# Write the Python code to an output file
echo -e "$python_code" > "output.txt"

echo "Data formatted and saved to output.txt"

