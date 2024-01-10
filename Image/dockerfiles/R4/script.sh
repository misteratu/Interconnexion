#!/bin/bash


# interfaces

ip link add eth1 type veth peer name eth2 type veth

ip link set dev eth1 up
ip link set dev eth2 up
#ip addr add flush dev eth0
#ip addr add flush dev eth1

# adresses

ip addr add 120.0.46.4/23 dev eth1
ip addr add 120.0.40.1/22 dev eth2

# routes

#ip route add 120.0.44.0/23 via 120.0.46.2
#ip route add 120.0.32.0/21 via 120.0.46.3

# quagga

/etc/init.d/zebra start
/etc/init.d/ospfd start

# boucle infinie pour garder le container ouvert

while true; do sleep 1000; done