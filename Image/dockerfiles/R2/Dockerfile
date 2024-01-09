FROM debian:buster-slim
RUN apt-get update
RUN apt-get -y install iptables apt-utils iproute2 net-tools systemd telnet nano iputils-ping tcpdump inetutils-traceroute quagga curl
RUN apt-get -f install

# Copy the network_setup.sh script into the container
COPY network_setup.sh /usr/local/bin/script.sh

# Grant execute permissions to the script
RUN chmod +x /usr/local/bin/script.sh

# Run the network setup script when the container starts
CMD ["/usr/local/bin/script.sh"]