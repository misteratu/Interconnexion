FROM debian:buster-slim

RUN apt-get -y update && apt-get -y install iptables apt-utils iproute2 net-tools systemd telnet nano iputils-ping tcpdump inetutils-traceroute bind9 && apt-get -f install

RUN mkdir /etc/scripts
ENV PATH "/etc/scripts:$PATH"
RUN mkdir /var/log/bind9
RUN chown bind:bind /var/log/bind9

COPY hosts /etc/bind/hosts
COPY named.conf /etc/bind/named.conf
COPY named.conf.options /etc/bind/named.conf.options
COPY projet.reseau.zone /var/bind/projet.reseau.zone

CMD /etc/init.d/bind9 start && tail -f /dev/null && ls -l /etc/bind && ls -l /var/bind