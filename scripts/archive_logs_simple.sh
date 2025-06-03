#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# archive_logs_simple.sh
#
# Archives a single device’s active log by moving it (renaming with timestamp)
# into its designated archive folder, then creating a new empty active log.
#
# Usage: ./archive_logs_simple.sh
# -----------------------------------------------------------------------------

# Base directories (adjust if your structure differs)
ACTIVE_DIR="hospital_data/active_logs"
ARCHIVE_BASE="hospital_data/archives"

# Get current timestamp in YYYY-MM-DD_HH:MM:SS format
TIMESTAMP=$(date +'%Y-%m-%d_%H:%M:%S')

echo "Select which log to archive:"
echo "  1) Heart Rate"
echo "  2) Temperature"
echo "  3) Water Usage"
read -p "Enter choice [1-3]: " choice

case "$choice" in
  1)
    DEVICE="heart_rate"
    ;;
  2)
    DEVICE="temperature"
    ;;
  3)
    DEVICE="water_usage"
    ;;
  *)
    echo "Invalid choice. Exiting."
    exit 1
    ;;
esac

LOGFILE="${DEVICE}.log"
SRC_PATH="${ACTIVE_DIR}/${LOGFILE}"
DEST_DIR="${ARCHIVE_BASE}/${DEVICE}"
DEST_PATH="${DEST_DIR}/${DEVICE}_${TIMESTAMP}.log"

# Ensure the active log exists
if [[ ! -f "$SRC_PATH" ]]; then
  echo "Error: Active log not found at $SRC_PATH"
  exit 1
fi

# Create archive directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Move (rename) the active log into the archive folder with timestamp
mv "$SRC_PATH" "$DEST_PATH"
if [[ $? -ne 0 ]]; then
  echo "Failed to move $SRC_PATH → $DEST_PATH"
  exit 1
fi
echo "Archived '$LOGFILE' → '$DEST_PATH'"

# Create a fresh, empty active log so the simulator can continue writing
touch "$SRC_PATH"
if [[ $? -ne 0 ]]; then
  echo "Error: Could not create new empty log at $SRC_PATH"
  exit 1
fi
echo "Created new empty log at '$SRC_PATH'"

echo "Done."
