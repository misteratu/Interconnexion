#!/bin/bash


# interfaces

#ip link set dev eth0 up
#ip addr add flush dev eth0

# adresses

#ip addr add 120.0.32.2/21 dev eth0

# routes

#ip route add 120.0.40.0/22 via 120.0.46.4
#ip route add 120.0.44.0/23 via 120.0.46.2
#ip route add 120.0.32.0/21 via 120.0.46.3

# quagga

/etc/init.d/zebra start
/etc/init.d/ospfd start

# boucle infinie pour garder le container ouvert

while true; do sleep 1000; done