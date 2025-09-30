#!/bin/bash
for i in {1..5}
do
	if [ "$1" -eq 3 ]; then
		continue
	fi
	echo "Number: $i"
done
	       	
