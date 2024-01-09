FROM debian:buster-slim
RUN apt-get update
RUN apt-get -y install iptables apt-utils iproute2 net-tools systemd telnet nano iputils-ping tcpdump inetutils-traceroute quagga curl
RUN apt-get -f install

# interfaces

RUN ip link set dev eth0 up
RUN ip addr add flush dev eth0

# adresses

RUN ip addr add 120.0.46.1/24 dev eth0

# routes

RUN ip route add 120.0.40.0/22 via 120.0.46.4
RUN ip route add 120.0.44.0/23 via 120.0.46.2
RUN ip route add 120.0.32.0/21 via 120.0.46.3
