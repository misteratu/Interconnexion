#!/bin/bash


# interfaces

ip link add eth1 type veth peer name eth2 type veth

ip link set dev eth1 up
ip link set dev eth2 up

# adresses

ip addr add 120.0.44.3/23 dev eth1

# routes

#ip route add 120.0.40.0/22 via 120.0.46.4
#ip route add 120.0.44.0/23 via 120.0.46.2

# quagga

sudo /etc/init.d/zebra start
sudo /etc/init.d/ospfd start
sudo /etc/init.d/asterisk start

# Démarrage de voip

sudo systemctl enable --now asterisk
sudo systemctl start asterisk
sudo systemctl status asterisk

# boucle infinie pour garder le container ouvert

while true; do sleep 1000; done