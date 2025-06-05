#!/bin/bash

echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " choice

case "$choice" in
    1)
        ARCHIVE_DIR="hospital_data/archived_logs/heart_data_archive"
        LOGNAME="Heart Rate"
        ;;
    2)
        ARCHIVE_DIR="hospital_data/archived_logs/temperature_data_archive"
        LOGNAME="Temperature"
        ;;
    3)
        ARCHIVE_DIR="hospital_data/archived_logs/water_usage_data_archive"
        LOGNAME="Water Usage"
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

LATEST_FILE=$(ls -t "$ARCHIVE_DIR"/*.log 2>/dev/null | head -n 1)

if [ ! -f "$LATEST_FILE" ]; then
    echo "No log files found in $ARCHIVE_DIR"
    exit 1
fi

echo "Device Count:"
awk -F '|' '{print $2}' "$LATEST_FILE" | sort | uniq -c

echo "First timestamp posted"
head -n 1 "$LATEST_FILE" | cut -d '|' -f1

echo "Last timestamp posted"
tail -n 1 "$LATEST_FILE" | cut -d '|' -f1

# -------- Reporting section starts here --------
REPORT_DIR="hospital_data/reports"
REPORT_FILE="${REPORT_DIR}/analysis_report.txt"

mkdir -p "$REPORT_DIR"

{
    echo "----- Analysis Report -----"
    echo "Log File Analyzed: $LOGNAME"
    echo "File: $LATEST_FILE"
    echo "Analysis Time: $(date '+%Y-%m-%d %H:%M:%S')"
    echo ""
    echo "Device Count:"
    awk -F '|' '{print $2}' "$LATEST_FILE" | sort | uniq -c
    echo ""
    echo -n "First timestamp: "
    head -n 1 "$LATEST_FILE" | cut -d '|' -f1
    echo -n "Last timestamp: "
    tail -n 1 "$LATEST_FILE" | cut -d '|' -f1
    echo -e "\n----------------------------\n"
} >> "$REPORT_FILE"
echo "Analysis complete. Results saved to $REPORT_FILE"


