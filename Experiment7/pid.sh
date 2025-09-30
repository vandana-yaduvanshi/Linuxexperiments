#!/bin/bash
#Script: process_dails.sh
#Ask user for PID

read -p "Enter PID: " pid

#Check if process exists
if ps -p $pid > /dev/null 2>&1
then
        echo "Process details for PID: $pid"

        state=$(ps -o state= -p $pid)
        ppid=$(ps -o ppid= -p $pid)
        mem=$(ps -o %mem= -p $pid)

        echo "State     : $state"
        echo "Parent PID: $ppid"
        echo "Memory Usage: $mem %"
else
        echo "No process found with PID: $pid"
fi	
