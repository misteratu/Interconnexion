#!/bin/bash

# Interface Réseaux Client
ip addr add 120.0.32.2/21 dev eth0
ip link set dev eth0 up

# Interface serveur privé
ip addr add 192.168.1.1/24 dev eth1
ip link set dev eth1 up

# Activation du routage
echo 1 > /proc/sys/net/ipv4/ip_forward

# Ajout de la route par défaut 
ip r a default via 120.0.32.1

# Configuration DHCP
service isc-dhcp-server start

# FIREWALL

# NAT
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j MASQUERADE
