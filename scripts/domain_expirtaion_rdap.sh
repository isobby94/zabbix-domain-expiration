#!/bin/bash

expiry_date=$(curl -s "https://rdap.identitydigital.services/rdap/domain/$1" | \
    grep -A1 '"eventAction": "expiration"' | grep -oP '(?<="eventDate": ")[^"]+')

if [ -z "$expiry_date" ]; then
    echo "Date not found for domain: $1"
else
    expire=$(date -d "$expiry_date" '+%s')
    today=$(date '+%s')
    lefts=$((expire - today))
    leftd=$((lefts / 86400))
    echo "$leftd"
fi