#!/bin/bash

# interfaces

#ip link add eth0 type veth peer name eth0-cont
#ip link add eth1 type veth peer name eth1-cont

#ip link set dev eth0 up
#ip link set dev eth1 up
#ip link set dev eth0-cont up
#ip link set dev eth1-cont up
#ip addr add flush dev eth0
#ip addr add flush dev eth1

# adresses

#ip addr add 120.0.46.2/23 dev eth0
#ip addr add 120.0.44.1/22 dev eth1

# routes

#ip route add 120.0.32.0/21 via 120.0.46.3
#ip route add 120.0.40.0/22 via 120.0.46.4

# quagga

/etc/init.d/zebra start
/etc/init.d/ospfd start

# boucle infinie pour garder le container ouvert

while true; do sleep 1000; done