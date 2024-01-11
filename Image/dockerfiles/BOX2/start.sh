#!/bin/bash

ip link add eth1 type veth peer name eth2

# Interface Réseaux Client
ip link set dev eth1 up
ip link set dev eth2 up
ip addr add 120.0.32.2/21 dev eth0


# Interface serveur privé
ip link set dev eth2 up
ip addr add 192.168.1.1/24 dev eth1

# Activation du routage
echo 1 > /proc/sys/net/ipv4/ip_forward


# Configuration DHCP
service isc-dhcp-server start

# FIREWALL

# NAT
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j MASQUERADE
