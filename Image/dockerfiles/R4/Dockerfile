FROM debian:buster-slim
RUN apt-get update
RUN apt-get -y install iptables apt-utils iproute2 net-tools systemd telnet nano iputils-ping tcpdump inetutils-traceroute quagga curl
RUN apt-get -f install
RUN ip link set dev eth0 up
RUN ip link set dev eth1 up
RUN ip addr add flush dev eth0
RUN ip addr add flush dev eth1
RUN ip addr add 120.0.46.4/24 dev eth0
RUN ip addr add 120.0.44.1/23 dev eth1
RUN ip route add 120.0.44.0/23 via 120.0.46.2
RUN ip route add 120.0.32.0/21 via 120.0.46.3