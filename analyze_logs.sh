#!/bin/bash

echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " choice

case "$choice" in
    1) LOGFILE="hospital_data/active_logs/heart_rate_log.log"
       LOGNAME="Heart Rate"
       ;;
    2) LOGFILE="hospital_data/active_logs/temperature_log.log"
       LOGNAME="Temperature"
       ;;
    3) LOGFILE="hospital_data/active_logs/water_usage_log.log"
       LOGNAME="Water Usage"
       ;;
    *) echo "Invalid choice. Exiting."; exit 1 ;;
esac

echo "Device Count:"
awk '{print $2}' "$LOGFILE" | sort | uniq -c

echo "First timestamp:"
head -n 1 "$LOGFILE" | awk '{print $1, $2}'

echo "Last timestamp:"
tail -n 1 "$LOGFILE" | awk '{print $1, $2}'

# -------- Reporting section starts here --------
REPORT_DIR="reports"
REPORT_FILE="${REPORT_DIR}/analysis_report.txt"

mkdir -p "$REPORT_DIR"

{
    echo "----- Analysis Report -----"
    echo "Log File Analyzed: $LOGNAME"
    echo "Analysis Time: $(date '+%Y-%m-%d %H:%M:%S')"
    echo ""
    echo "Device Count:"
    awk '{print $2}' "$LOGFILE" | sort | uniq -c
    echo ""
    echo -n "First timestamp: "
    head -n 1 "$LOGFILE" | awk '{print $1, $2}'
    echo -n "Last timestamp: "
    tail -n 1 "$LOGFILE" | awk '{print $1, $2}'
    echo -e "\n----------------------------\n"
} >> "$REPORT_FILE"

