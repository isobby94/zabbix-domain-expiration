#!/bin/bash

expiry_date=$(grep "^$1=" /usr/lib/zabbix/externalscripts/domain_expiration_manual.conf | cut -d'=' -f2)

if [ -z "$expiry_date" ]; then
    echo "Date not found for domain: $1"
else
    expire=$(date -d "$expiry_date" '+%s')
    today=$(date '+%s')
    lefts=$((expire - today))
    leftd=$((lefts / 86400))
    echo "$leftd"
fi