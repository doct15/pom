#!/bin/bash
#
PASSWORD=$(cat /etc/pom.pwd)
sendemail -f doc@tavian.com -t doc@tavian.com -u "POM" -m "$(pom $(date '+%Y%m%d08');pom $(date '+%Y%m%d20');echo "";echo "Your fortune...";fortune)" -s smtp.tavian.com:587 -xu distelli@tavian.com -xp $PASSWORD -v