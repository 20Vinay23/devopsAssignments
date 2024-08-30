#!/bin/bash

services=("apache2" "mysql")
recipient="teammail@gmail.com"
subject="Service Alert: Service stopped"

all_services_running=true
for service in "${services[@]}"; do
    if ! systemctl is-active --quiet "$service"; then
        email_body="The service $service has stopped on $(hostname) at $(date). Please check the service status and take appropriate action."
        echo "$email_body" | mail -s "$subject" "$recipient"

        all_services_running=false
    fi
done

# Check if all services were running
if $all_services_running; then
    echo "All services are working fine."
fi
