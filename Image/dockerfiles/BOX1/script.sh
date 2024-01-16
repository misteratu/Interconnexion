#!/bin/bash

# adresses

ip addr add 120.0.32.2/21 dev eth0

# Configuration DHCP
service isc-dhcp-server start

# routes

ip r a default via 120.0.32.1

# NAT
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j MASQUERADE


# FIREWALL
iptables -A INPUT -p icmp --icmp-type 8 -j ACCEPT
iptables -A INPUT -j DROP
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -j DROP
iptables -A OUTPUT -j DROP
# quagga

/etc/init.d/zebra start
/etc/init.d/ospfd start

# boucle infinie pour garder le container ouvert

while true; do sleep 1000; done