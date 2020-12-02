#!/bin/bash
#
PASSWORD=$(cat /etc/pom.pwd)
sendemail -f doc@tavian.com -t jo@tavian.com -u "Affirmation $(date '+%Y-%m-%d')" -m "$(curl -s "https://www.affirmations.dev" | jq '.affirmation')" -s smtp.tavian.com:587 -xu distelli@tavian.com -xp $PASSWORD -v
