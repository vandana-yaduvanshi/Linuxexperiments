# Daily User Log Archiver

**Assignment By:** Vandana Yadav
**Date:** 2025-10-17

## OVERVIEW
A Bash script that logs system information daily, rotates and archives old logs, automates monitoring of system usage and keeps logs organized.

## FEATURES
- Daily logs: user, date, uptime, top 5 CPU processes, disk usage
- Moves logs older than 7 days to `archive/`
- Weekly compression of archived logs (`.tar.gz`)
- Safe for empty folders
- Optional menu for manual logging, archiving, and viewing logs
- Can be scheduled with cron for full automation

## Setup
1. Clone repo:
```bash
git clone https://github.com/vandana-yaduvanshi/DailyUserLogArchiver.git
cd DailyUserLogArchiver
```

2. Make the script executable:
```bash
chmod +x daily_log.sh










