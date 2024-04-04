#!/bin/bash

API_URL="https://api.orhanaydogdu.com.tr/deprem/kandilli/live"
LAST_CHECKED_FILE="/home/dede/misctools/deprem/last_timestamp.txt"

# Generate the current timestamp
current_timestamp=$(date +"%Y-%m-%d %H:%M:%S")

# Read the last checked timestamp from the file
last_checked_timestamp=$(cat "$LAST_CHECKED_FILE" 2>/dev/null)

# Fetch earthquake data
earthquake_info=$(curl -s "$API_URL" | jq -r '.result | map("\(.title) - Mag \(.mag) - Date \(.date)") | join("\n")')

# Get the timestamp of the latest earthquake
latest_timestamp=$(echo "$earthquake_info" | grep -oP '\d{4}\.\d{2}\.\d{2} \d{2}:\d{2}:\d{2}' | head -n 1)

# Check if there are new earthquakes by comparing timestamps
if [ "$latest_timestamp" != "$last_checked_timestamp" ]; then
    echo "$earthquake_info" | awk '{print $1, $3, $5}' | rofi -dmenu -p "Earthquake Alarms" -lines 5
    # Update the last checked timestamp in the file
    echo "$current_timestamp" > "$LAST_CHECKED_FILE"
fi
