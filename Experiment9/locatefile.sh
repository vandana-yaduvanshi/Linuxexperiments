#!/bin/bash


dir="/home/$USER"

count=$(find "$dir" -type f -name "*.sh" | wc -1)

echo "Number of .sh files in $dir: $count"
