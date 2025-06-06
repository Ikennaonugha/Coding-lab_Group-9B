Automated Log Management System.
This Formative Project presents a system for collecting, archiving, and analyzing real-time patient health metrics and resource usage data within a simulated hospital environment. It demonstrates proficiency in interactive shell scripting, log file processing and Linux tools.

Project Objective
Key objectives include:

Collecting real-time patient health metrics such as heart Rateand temperature along with water usage via Python simulators.

Providing controlled log archiving with user selection, making sure old data is properly stored with timestamps.

Generating analytical reports that offer insights into device statistics and temporal patterns within the collected data.

Demonstrating proficiency in:

Interactive shell scripting

Log file processing

Data analysis with standard Linux tools

Features
This system has two shell scripts that interact with simulated data streams:

1) Interactive Archival Script (archive_logs.sh):

Numbered menu: Prompts the user to select a specific log file type for archiving.

Selective Archiving: Archives only the chosen log file, moving it from the active directory to a designated archive folder.

Timestamping: Renames the archived log file with a precise timestamp (e.g., heart_rate_YYYY-MM-DD_HH-MM-SS.log) for historical tracking.

Continuous Monitoring: Automatically creates a new empty log file in the active directory.

Error Handling: Includes checks for invalid user input, missing log files, and issues with archive directories.

2) Intelligent Analysis Script (analyze_logs.sh):

Interactive Prompt: Presents a menu for the user to choose which log file to analyze.

Analysis Functionality: Counts the occurrences of each unique device (e.g., "Heart Monitor 1", "Temperature Sensor 2") found within the selected log file.

Records the timestamp of the first and last entry for each device along with total count per device.

Automated Reporting: Appends the results to reports/analysis_report.txt file.

Usage
archive_logs.sh - Interactive Archival Script
Example Usage:

$ ./archive_logs.sh
Select log to archive:
1) Heart Rate
2) Temperature
3) Water Usage
Enter choice (1-3): 1

Archiving heart_rate.log...
Successfully archived 'heart_rate.log' to 'hospital_data/archived_logs/heart_data_archive/heart_rate_2024-06-18_15-22-10.log'.

analyze_logs.sh - Intelligent Analysis Script
Example Usage:

$ ./analyze_logs.sh
Select log file to analyze:
1) Heart Rate (heart_rate.log)
2) Temperature (temperature.log)
3) Water Usage (water_usage.log)
Enter choice (1-3): 2

Analyzing temperature.log...
Analysis complete. Results appended to reports/analysis_report.txt.

Example Content of reports/analysis_report.txt after running analyze_logs.sh (content will vary based on log data):

--- Analysis Report ---
Timestamp: 2024-06-18 16:00:00

Log File: temperature.log
Device Statistics:
  Temperature Sensor 1: Total Entries = 120, First Entry = 2024-06-18 09:30:15, Last Entry = 2024-06-18 15:58:00
  Temperature Sensor 2: Total Entries = 115, First Entry = 2024-06-18 09:30:20, Last Entry = 2024-06-18 15:57:30
