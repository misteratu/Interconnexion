#!/bin/bash


# interfaces

ip link set dev eth0 up
ip link set dev eth1 up
#ip addr add flush dev eth0
#ip addr add flush dev eth1

# adresses

ip addr add 120.0.46.3/24 dev eth0
ip addr add 120.0.32.1/21 dev eth1

# routes

ip route add 120.0.40.0/22 via 120.0.46.4
ip route add 120.0.44.0/23 via 120.0.46.2