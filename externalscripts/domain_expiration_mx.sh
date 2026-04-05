#!/bin/bash

expiry_date=$(whois -h whois.mx $1 | grep -i 'expiration date:' | awk '{print $3}')

# Check if the expiry date is not found
if [ -z "$expiry_date" ]; then
    echo "Date not found for domain: $1"
else
    # Convert the expiry date to the 'Y-m-d' format
    expiry_date=$(date -d "$expiry_date" +"%Y-%m-%d")

    # Calculate the number of remaining days
    expire=$(date -d "$expiry_date" '+%s')
    today=$(date '+%s')
    lefts=$((expire - today))
    leftd=$((lefts / 86400))

    echo "$leftd"
fi