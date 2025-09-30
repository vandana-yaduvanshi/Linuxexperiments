#!/bin/bash
# Script: search_count.sh

# Prompt for filename
read -p "Enter filename: " file

# Check if file exists
if [ ! -f "$file" ]; then
    echo "Error: File '$file' does not exist."
    exit 1
fi

# Prompt for search pattern
read -p "Enter search pattern: " pattern

# Count matching lines
count=$(grep -c "$pattern" "$file")

echo "Number of lines matching '$pattern' in '$file': $count"

