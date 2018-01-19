#!/bin/bash
#
PASSWORD=$(cat /etc/pom.pwd)
sendemail -f doc@tavian.com -t clpetermann66@gmail.com -u "Will You be a Millionaire today?" -m "If you buy a lottery ticket today, you may win!" -s smtp.tavian.com:587 -xu distelli@tavian.com -xp $PASSWORD -v
