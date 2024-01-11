FROM debian:buster-slim

RUN apt-get -y update
RUN apt-get -y install iptables apt-utils lsb-base iproute2 net-tools systemd telnet nano iputils-ping tcpdump inetutils-traceroute quagga curl bind9
RUN apt-get -f install

# Quagga

COPY ./quagga /etc/quagga

# Copy the script.sh script into the container
COPY script.sh /usr/local/bin/script.sh

# Grant execute permissions to the script
RUN chmod +x /usr/local/bin/script.sh

# DNS

RUN mkdir /etc/scripts
ENV PATH "/etc/scripts:$PATH"
RUN mkdir /var/log/bind9
RUN chown bind:bind /var/log/bind9

COPY hosts /etc/bind/hosts
COPY named.conf /etc/bind/named.conf
COPY named.conf.options /etc/bind/named.conf.options
COPY projet.reseau.zone /var/bind/projet.reseau.zone

# Run the network setup script when the container starts
CMD ["/usr/local/bin/script.sh"]