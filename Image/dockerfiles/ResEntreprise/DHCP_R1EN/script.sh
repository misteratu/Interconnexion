#!/bin/bash


# interfaces

ip link add eth1 type veth peer name eth2 type veth

ip link set dev eth1 up
#ip addr add flush dev eth0

# adresses

ip addr add 120.0.40.3/22 dev eth1

# quagga

/etc/init.d/zebra start
/etc/init.d/ospfd start

# boucle infinie pour garder le container ouvert

while true; do sleep 1000; done