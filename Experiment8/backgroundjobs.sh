#!/bin/bash
# Script: job_control.sh

echo "Starting background job: sleep 60"
sleep 60 &        # Start job in background
job_pid=$!

echo "Background job started with PID: $job_pid"

echo
echo "Listing all jobs:"
jobs -l           # List jobs with PID

echo
echo "Bringing job to foreground..."
fg %1             # Bring job (job number 1) to foreground

echo
echo "Terminating job..."
kill -9 $job_pid 2>/dev/null

echo "Job terminated."

