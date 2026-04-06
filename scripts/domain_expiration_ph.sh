#!/bin/bash

domain="$1"

# Send the request and save the output in a variable
response=$(curl -s "https://whois.dot.ph/?utf8=%E2%9C%93&search=$domain&button=")

# Extract the value of expiryDate from the output using grep and a regular expression
expiry_date=$(echo "$response" | grep -oP "(?<=var expiryDate = moment\(')(.*)(?='\)\.format)")

# Check if the expiry date is not found
if [ -z "$expiry_date" ]; then
    echo "Date not found for domain: $domain"
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