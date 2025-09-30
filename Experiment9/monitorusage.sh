#!/bin/bash


logfiles="/home?$USER?cpu_log.txt"

echo "CPU monitoring started... (logging every 10 seconds)"
echo "Logs will be saved to: $logfile"
echo "____________________________________" >> "$logfiles"

while true
do
	echo "Timestamp: $(date)" >> "$logfile"

	top -b -n1 |  grep "Cpu(s)" >> "$logfiles"
	echo "____________________________________"
	sleep 10
done
