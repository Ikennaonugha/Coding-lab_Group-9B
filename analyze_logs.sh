#!/bin/bash

echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"

# prompt user to enter a choice
read -p "Enter choice (1-3): " user_input

if [[ $user_input != 1 || 2 || 3 ]] ; then
	echo "Invalid input, enter 
