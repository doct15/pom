FROM ubuntu:14.04
RUN apt-get update
RUN /bin/bash -c 'debconf-set-selections <<< "postfix postfix/mailname string your.hostname.com"'
RUN /bin/bash -c 'debconf-set-selections <<< "postfix postfix/main_mailer_type string \"Internet Site\""'
RUN apt-get -y install bsdgames mailutils libio-socket-ssl-perl libnet-ssleay-perl sendemail telnet
CMD ["/bin/bash"]
