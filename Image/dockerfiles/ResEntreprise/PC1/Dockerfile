FROM debian:buster-slim
RUN apt-get -y update
RUN apt-get -y install iptables apt-utils lsb-base iproute2 net-tools systemd telnet nano iputils-ping tcpdump inetutils-traceroute quagga curl wget isc-dhcp-client snap
RUN apt-get -y install mumble
RUN apt-get install -y x11-apps
RUN apt-get -f install

#RUN snap install discord

# Copy the script.sh script into the container
COPY script.sh /usr/local/bin/script.sh

# Grant execute permissions to the script
RUN chmod +x /usr/local/bin/script.sh

# Run the network setup script when the container starts
CMD ["/usr/local/bin/script.sh"]