#!/bin/bash


# interfaces

ip link add eth1 type veth peer name eth2 type veth

ip link set dev eth1 up
ip link set dev eth2 up

# adresses

ip addr add 120.0.32.2/21 dev eth1

# Activation du routage
echo 1 > /proc/sys/net/ipv4/ip_forward

# Configuration DHCP
service isc-dhcp-server start

# routes

ip r a default via 120.0.32.1

# NAT
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp -i eth1 --dport 80 -j DNAT --to 192.168.139.129


# FIREWALL
iptables -A FORWARD -i eth1 -j DROP
iptables -A FORWARD -i eth1 -p ICMP -j ACCEPT
iptables -A FORWARD -i eth1 -p tcp -dport 80 -j ACCEPT
iptables -A FORWARD -i eth1 -p tcp -dport 53 -j ACCEPT
iptables -A FORWARD -i eth1 -p udp -dport 53 -j ACCEPT
# quagga

/etc/init.d/zebra start
/etc/init.d/ospfd start

# boucle infinie pour garder le container ouvert

while true; do sleep 1000; done