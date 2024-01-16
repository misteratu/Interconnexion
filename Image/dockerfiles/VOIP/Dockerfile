FROM debian:buster-slim
RUN apt-get -y update && \
    apt-get -y install asterisk asterisk-dahdi iptables apt-utils lsb-base iproute2 net-tools systemd telnet nano iputils-ping tcpdump inetutils-traceroute quagga curl && \
    apt-get clean all

# Quagga et Asterisk

COPY ./quagga /etc/quagga
COPY ./asterisk /etc/asterisk

# Expose ports SIP et RTP (à voir)

EXPOSE 5060/udp 10000-20000/udp

# Copy the script.sh script into the container
COPY script.sh /usr/local/bin/script.sh

# Grant execute permissions to the scripts
RUN chmod +x /usr/local/bin/script.sh
RUN chmod +x /usr/sbin/asterisk

# Run the network setup script when the container starts
CMD ["/bin/bash", "-c", "/usr/local/bin/script.sh && /usr/sbin/asterisk -f"]