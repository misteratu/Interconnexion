FROM debian:buster-slim
RUN apt-get -y update
RUN apt-get -y install iptables apt-utils lsb-base iproute2 net-tools telnet nano iputils-ping tcpdump inetutils-traceroute quagga curl wget apache2
RUN apt-get -y install mumble-server
RUN apt-get -f install


#  telnet nano iputils-ping tcpdump inetutils-traceroute quagga curl wget
# Copy the script.sh script into the container
COPY script.sh /usr/local/bin/script.sh
COPY ./index.html /usr/local/apache2/htdocs/

# Grant execute permissions to the script
RUN chmod +x /usr/local/bin/script.sh

# Run the network setup script when the container starts
CMD ["/usr/local/bin/script.sh"]
