#!/bin/bash

# Partie Configuration DHCP
dhclient eth1


# boucle infinie pour garder le container ouvert

while true; do sleep 1000; done
