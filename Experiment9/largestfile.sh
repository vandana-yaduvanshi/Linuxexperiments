#!/bin/bash
# Find the largest file in a directory

# Ask for directory
read -p "Enter directory path: " dir

# Check if directory exists
if [ ! -d "$dir" ]; then
    echo "Directory does not exist."
    exit 1
fi

# Find the largest file
largest_file=$(ls -S "$dir" 2>/dev/null | head -n 1)

if [ -z "$largest_file" ]; then
    echo "No files found in the directory."
else
    echo "Largest file: $largest_file"
fi
