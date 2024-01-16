#!/bin/bash

# Partie Configuration DHCP
ip link set dev eth1 up
dhclient eth1


# boucle infinie pour garder le container ouvert

while true; do sleep 1000; done
