#!/bin/bash


# interfaces

ip link set dev eth0 up
#ip addr add flush dev eth0

# adresses

ip addr add 120.0.40.3/22 dev eth0

# quagga

/etc/init.d/zebra start
/etc/init.d/ospfd start

# boucle infinie pour garder le container ouvert

while true; do sleep 1000; done