#!/bin/bash

# File to store IPs
IP_FILE="myips.txt"

# Create the file if it doesn't exist
if [ ! -f "$IP_FILE" ]; then
    touch "$IP_FILE"
fi

# Get current IP address
CURRENT_IP=$(curl -s https://ipv4.jsonip.com/ | grep -o '"ip":"[^"]*' | cut -d'"' -f4)

# Get the last line from IP file
LAST_IP=$(tail -n 1 "$IP_FILE" | awk '{print $1}')

# If file is empty or the current IP is different from the last recorded IP
if [ -z "$LAST_IP" ] || [ "$CURRENT_IP" != "$LAST_IP" ]; then
    # Get current date and time
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    
    # Append the new IP with timestamp to the file
    echo "$CURRENT_IP - $TIMESTAMP" >> "$IP_FILE"
    
    echo "New IP recorded: $CURRENT_IP"
else
    echo "IP unchanged: $CURRENT_IP"
fi
