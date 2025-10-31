#!/bin/bash

echo "Enter filename: "
read file

if [ -e "$file" ]; then
   [ -r "$file" ] && echo "File is readable" 
   [ -w "$file" ] && echo "File is writable"
   [ -x "$file" ] && echo "File is executable"
else
	echo "File does not exist."
fi
