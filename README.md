# Readme
The LINPACK Benchmarks are a measure of a system's floating-point computing power. Introduced by Jack Dongarra, they measure how fast a computer solves a dense n by n system of linear equations Ax = b, which is a common task in engineering.

## Hopper ##

### General ###
up to 2 Nodes
up to 32 cpus/Node 
up to 90gb ram/Node

### Condo ###
	#!/bin/bash
	#SBATCH --job-name HPL_condo
	#SBATCH --partition condo
	#SBATCH --time 2-00:00:00
	#SBATCH --mem 220GB
	#SBATCH -N 6
	#SBATCH -n 192

## Wheeler ## 
	#SBATCH --partition normal 


