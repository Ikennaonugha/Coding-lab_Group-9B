#!/bin/bash

ARCHIVE_Dir="hospital_data/archived_logs"

echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter any choice [1-3]: " choice

if [[ "$choice" != "1" && "$choice" != "2" && "$choice" != "3" ]]; then
        echo "Invalid choice, Wrong input"
        exit 1
fi

case $choice in

        1)
                ARCHIVE_DIR="$ARCHIVE_Dir/heart_data_archive"
                ;;
        2)
                ARCHIVE_DIR="$ARCHIVE_Dir/temperature_data_archive"
                ;;
        3)
                ARCHIVE_DIR="$ARCHIVE_Dir/water_usage_data_archive"
                ;;
esac
