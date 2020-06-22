#!/bin/bash

#
## This script generates 6-digit pseudo-random bash numbers. As many as user wants, and prints the to file named user_seeds.txt
## Usage: bash bash_randoms.sh {Number of randoms}
#

# Store user input (number of random values) to variable $NRANDS
NRANDS=$1

for i in $(seq 1 $NRANDS); do
	randpart1=$(( RANDOM % 10000)) # First part of random number. Until 10000
	randpart2=$(( RANDOM % 10000)) # Second part of random number. Until 10000
	randnum=$(echo "${randpart1}${randpart2}") # Concatenate random numbers
	randdigits=$(echo -n "$randnum" | wc -c) # Counts the number of digits in the random number
	differ=$(( 6 - $randdigits ))
# This "if" places leading zeroes if random number is less than 6 digits
	if [ $differ -lt 1 ]; then
		psrand=$(echo -n "$randnum" | cut -c 1-6 )
		echo "$psrand"
	else
		leadzeroes=$(for j in $(seq 1 $differ); do echo -n "0"; done)
		psrand=$(echo "${leadzeroes}${randnum}")
		echo "$psrand"
	fi
done > user_seeds.txt # Saves numbers to file
