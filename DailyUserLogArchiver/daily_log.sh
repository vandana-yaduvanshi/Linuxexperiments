#!/bin/bash
# Daily User Log Archiver
# Author: Vandana Yadav
# Date: $(date +'%Y-%m-%d')
# Description: Logs system info, rotates logs, archives old logs, optional email, and menu=u for manual actions

# == Setup directories ==
LOG_DIR="$HOME/daily_logs"
ARCHIVE_DIR="$LOG_DIR/archive"

mkdir -p "$LOG_DIR"
mkdir -p "$ARCHIVE_DIR"

# === Create a new log file ===
LOG_FILE="$LOG_DIR/log_$(date +'%Y-%m-%d_%H-%M-%S').txt"

# === Collect system info ===
{
echo "==== Daily User Log Archiver ===="
echo "User: $(whoami)"
echo "Date: $(date)"
echo "Uptime: $(uptime -p)"
echo "Top 5 CPU consuming processes:"
ps -eo pid,comm,%mem,%cpu --sort=-%cpu | head -n 6
echo "Disk Usage:"
df -h
if ls "$LOG_DIR"/* 1>/dev/null 2>&1; then
	du -sh "$LOG_DIR"/*
else
	echo "No logs yet"
fi
echo "=========================================="
} >> "$LOG_FILE"

# === Archive old logs older than 7 days ===
OLD_LOGS=$(find "$LOG_DIR" -maxdepth 1 -name "log_*.txt" -mtime +7)
if [ -n "$OLD_LOGS" ]; then
	echo "Archiving old logs..."
	mv $OLD_LOGS "$ARCHIVE_DIR"/
fi

# === Weekly compression (tar.gz) ===
WEEKLY_ARCHIVE="$ARCHIVE_DIR/archive_$(date +'%y-%m-%d').tar.gz"
if [ "$(ls -A $ARCHIVE_DIR/*.txt 2>/dev/null)" ];then
	 tar -czf "$WEEKLY_ARCHIVE" -C "$ARCHIVE_DIR" . --remove-files
fi	
 	
