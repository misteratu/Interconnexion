#!/bin/sh
docker kill R1AS R2 R2EN R2EX SDHCP MACHINE1 MACHINE2 WEB BOX1 BOX2 R3
docker rm R1AS R2 R2EN R2EX SDHCP MACHINE1 MACHINE2 WEB BOX1 BOX2 R3
docker network rm r_en r_as r_dhcp_routeur r_prive r_fai r_ext
