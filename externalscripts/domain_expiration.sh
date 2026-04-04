#!/bin/bash
DOMAIN="$1"
exdate=`whois $DOMAIN | grep -E 'paid|Expire|Expiry' | grep -o -E '[0-9]{4}.[0-9]{2}.[0-9]{2}|[0-9]{2}/[0-9]{2}/[0-9]{4}'`
expire=$((`date -d "$exdate" '+%s'`))
today=$((`date '+%s'`))
leftsec=$(($expire - $today))
leftdays=$(($leftsec/86400))
echo $leftdays