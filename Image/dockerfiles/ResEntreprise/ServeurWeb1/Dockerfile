FROM debian:buster-slim
RUN apt-get -y update
RUN apt-get -y install iptables apt-utils lsb-base iproute2 net-tools systemd telnet nano iputils-ping tcpdump inetutils-traceroute quagga curl wget
RUN apt-get -f install


# Copy the script.sh script into the container
COPY script.sh /usr/local/bin/script.sh
COPY index.html /index.html

# Grant execute permissions to the script
RUN chmod +x /usr/local/bin/script.sh

# Run the network setup script when the container starts
CMD ["/usr/local/bin/script.sh"]