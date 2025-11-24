#!/bin/bash

echo "Enter directory path:"
read dir

if [ ! -d "$dir" ]
then
    echo "Directory does not exist"
    exit 1
fi

largest_file=$(ls -S "$dir" | head -1)

echo "Largest file in $dir is: $largest_file"

