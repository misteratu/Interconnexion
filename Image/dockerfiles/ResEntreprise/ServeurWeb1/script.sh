#!/bin/bash

ip link add eth1 type veth peer name eth2 type veth

ip link set dev eth1 up
ip link set dev eth2 up
ip addr add 192.168.199.2/24 eth1



# create serveur
service apache2 start

/etc/init.d/mumble-server start

while true; do sleep 1000; done