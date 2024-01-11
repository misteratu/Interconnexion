#!/bin/bash


ip link add eth1 type veth peer name eth2 type veth
ip link set dev eth1 up
ip link set dev eth2 up
dhclient eth1


while true; do sleep 1000; done