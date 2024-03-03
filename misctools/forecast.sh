#!/bin/bash

# Prompt user for location input
read -p "Enter location: " location

# Prompt user for report type
read -p "Choose report type:
1. Basic
2. Detailed
Enter the number (1/2): " report_choice

# Validate user input for report type
case "$report_choice" in
    1)
        curl "wttr.in/$location"
        ;;
    2)
        curl "v2d.wttr.in/$location"
        ;;
    *)
        echo "Invalid choice. Please enter 1 for basic or 2 for detailed."
        ;;
esac
