#!/bin/bash

# Reminder
printf "Welcome to the calculator. Please remember that the calculator only accepts and outputs decimals, so don't enter fractions.\n"

# Asks the user to enter the first number
printf "Enter the first number.\n"
read first_number

# Checks if the variable is a number, if it isn't, asks the user to enter a number
if ! [[ $first_number =~ ^-?[0-9]*\.?[0-9]+$ ]]; then
  until [[ $first_number =~ ^-?[0-9]*\.?[0-9]+$ ]]
    do
      printf "Please enter a number.\n"
      read first_number
    done
fi

# Asks the user to enter the second number
printf "Enter the second number.\n"
read second_number

# Checks if the variable is a number, if it isn't, asks the user to enter a number
if ! [[ $second_number =~ ^-?[0-9]*\.?[0-9]+$ ]]; then
  until [[ $second_number =~ ^-?[0-9]*\.?[0-9]+$ ]]
    do
      printf "Please enter a number.\n"
      read second_number
    done
fi

# Asks the user to enter the arithmetic operator
printf "Enter the arithmetic operator. (+|-|*|/)\n"
read operation

# Checks if the operator is one of the 4 (+|-|*|/) operators. If it isn't, asks the user to enter one of the 4 operators
if [[ $operation != "+" || $operation == "-" || $operation == "*" || $operation == "/" ]]; then
  until [[ $operation == "+" || $operation == "-" || $operation == "*" || $operation == "/" ]]
    do
      printf "Please enter a viable operation.\n"
      read operation
    done
fi

# Outputs the result prompt
echo "The result of $first_number $operation $second_number is:"

# Calculates based on the variables provided. Rounds it to 2 decimal places
if [[ $operation == "+" ]]; then
  echo "scale=2; ${first_number}+${second_number}" | bc
elif [[ $operation == "-" ]]; then
  echo "scale=2; ${first_number}-${second_number}" | bc
elif [[ $operation == "*" ]]; then
  echo "scale=2; ${first_number}*${second_number}" | bc
elif [[ $operation == "/" ]]; then
  echo "scale=2; ${first_number}/${second_number}" | bc
fi
