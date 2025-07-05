#!/bin/bash

# Welcome to the improved calculator!
# I noticed the old one was too long, so I made this one so you can just type in the problem. Enjoy!

# Get input parameters from command line arguments
first_number="$1" 
operator="$2"
second_number="$3"

# Validate that the operator is one of the four basic math operations
if [[ $operator != "+" && $operator != "-" && $operator != "*" && $operator != "/" ]]; then
  printf "Not a viable operator! Try again.\n"
  exit 1 # Exit with error code 1
fi

# Regular expression pattern to match valid numbers (including negative numbers and decimals)
number="^-?[0-9]+\.?[0-9]*$"

# Validate that the first argument is a valid number
if [[ ! $first_number =~ $number ]]; then
  printf "Not a number! Try again.\n"
  exit 2 # Exit with error code 2
# Validate that the second argument is a valid number
elif [[ ! $second_number =~ $number ]]; then
  printf "Not a number! Try again.\n" 
  exit 3 # Exit with error code 3
fi

# Perform the calculation based on the operator using case statement
case $operator in
  "+") result=$(echo "scale=2; ${first_number}+${second_number}" | bc) ;;
  "-") result=$(echo "scale=2; ${first_number}-${second_number}" | bc) ;;
  "*") result=$(echo "scale=2; ${first_number}*${second_number}" | bc) ;;
  "/") result=$(echo "scale=2; ${first_number}/${second_number}" | bc) ;;
esac

# Display the calculation result
# %s placeholders will be replaced with the actual values
printf "%s %s %s = %s\n" "$first_number" "$operator" "$second_number" "$result"
