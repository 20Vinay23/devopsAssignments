#!/bin/bash

recipient="testemail@gmail.com"
subject="Alert: High Memory Usage"
threshold=70

memory_usage=$(free | awk '/Mem:/ {printf "%.0f\n", $3/$2 * 100}')

# Check if memory usage exceeds the threshold
if (( memory_usage >= threshold )); then
    echo "Warning: Server memory usage has reached ${memory_usage}% on $(hostname) at $(date). Please take appropriate action."
    mail -s "$subject" "$recipient"
else
    echo "Memory usage is at ${memory_usage}%, which is below the threshold of ${threshold}% on $(hostname) at $(date). Everything is running smoothly."
fi
