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

ACTIVE_LOG_DIRECTORY="hospital_data/active_logs"

ARCHIVE_LOG_DIRECTORY="hospital_data/archived_logs"

mkdir -p "${ACTIVE_LOG_DIRECTORY}" # ensures the active log dir exists

# function to archive selected folder

archive_choice() {
	
	local log_file="$1"
	local archive_subdir="$2"
	local archive_file="$3"

	local active_log_path="${ACTIVE_LOG_DIRECTORY}/${log_file}"
	local archive_dir="${ARCHIVE_LOG_DIRECTORY}/${archive_subdir}"

	mkdir -p "${archive_dir}" # ensures the target dir exists

	if [ ! -f "${active_log_path}" ]; then
		echo "WARNING: Active log file '${active_log_path}' is missing"
		echo "Creating new empty file at '${active_log_path}'"
		touch "${active_log_path}"
		
	fi

	# To generate timestamp
 	local timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
	
	#Making archived_file_path
	local archived_file_path="${archive_dir}/${archive_file}_${timestamp}.log"

	echo "Archiving ${log_file}..."

 	# Moving the file
	mv "${active_log_path}" "${archived_file_path}"
	echo "Successfully archived to ${archived_file_path}"
	
	#creating new empty log file for continued monitoring
	touch "${active_log_path}"
	
}

if [ "$user_input" -eq 1 ] ; then
	archive_choice "heart_rate.log" "heart_data_archive" "heart_rate"
	
elif [ "$user_input" -eq 2 ] ; then
	archive_choice "temperature.log" "temperature_data_archive" "temperature"

elif [ "$user_input" -eq 3 ] ; then
	archive_choice "water_usage.log" "water_usage_data_archive" "water_usage"
fi


