#!/bin/bash


# interfaces

ip link add eth1 type veth peer name eth2 type veth

ip link set dev eth1 up
ip link set dev eth2 up
#ip addr add flush dev eth0

# adresses

ip addr add 120.0.44.2/23 dev eth1

# routes

#ip route add 120.0.40.0/22 via 120.0.46.4
#ip route add 120.0.44.0/23 via 120.0.46.2
#ip route add 120.0.32.0/21 via 120.0.46.3

# quagga et bind9

/etc/init.d/zebra start
/etc/init.d/ospfd start
/etc/init.d/bind9 start
tail -f /dev/null

# boucle infinie pour garder le container ouvert

while true; do sleep 1000; done