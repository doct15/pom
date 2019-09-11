FROM ubuntu:14.04
RUN /bin/bash -c 'debconf-set-selections <<< "postfix postfix/mailname string your.hostname.com"'
RUN /bin/bash -c 'debconf-set-selections <<< "postfix postfix/main_mailer_type string \"Internet Site\""'
RUN apt-get update && apt-get -y install bsdgames mailutils libio-socket-ssl-perl libnet-ssleay-perl ca-certificates sendemail telnet
#CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
CMD exec /bin/bash -c 'sendemail -f doc@tavian.com -t doc@tavian.com -u "POM" -m "$(/usr/games/pom $(date "+%Y%m%d08");/usr/games/pom $(date "+%Y%m%d20");echo "";echo "Your fortune...";/usr/games/fortune)" -s smtp.tavian.com:587 -xu distelli@tavian.com -xp $PASSWORD -v'

