# IP Tracker

This script tracks your public IP address changes and logs them to a file with timestamps.

## How It Works

1. The script fetches your current public IP address from https://ipv4.jsonip.com/
2. It compares the current IP with the last recorded IP in `myips.txt`
3. If the IP has changed or the file is empty, it adds the new IP with timestamp
4. It automatically commits and pushes the changes to your GitHub repository

## Usage

Run the script with:

```bash
./ip_tracker.sh
```

For automatic tracking, set up a cron job to run this script periodically:

```bash
# Run every hour
0 * * * * cd /path/to/repository && ./ip_tracker.sh >> ip_tracker.log 2>&1
```