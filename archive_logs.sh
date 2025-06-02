#!/bin/bash

echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"

# input validation loop
while true; do 
	# promt user for input
	read -p "Enter choice (1-3): " user_input

	# validate input using if-else with OR 
	if [ "$user_input" -eq 1 ] || [ "$user_input" -eq 2 ] || [ "$user_input" -eq 3 ]; then
		break
	else
		echo "ERROR: '$user_input' is not a valid choice. Enter either 1, 2, or 3."
	fi
done

if [ "$user_input" -eq 1 ] ; then


