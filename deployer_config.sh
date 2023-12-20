#!/bin/sh
# construction des images à partir des dockerfiles
docker build ./dockerfiles/R1 -t image_routeur_r1
docker build ./dockerfiles/R1EN -t image_routeur_r1en
docker build ./dockerfiles/R2 -t image_routeur_r2
docker build ./dockerfiles/R2EN -t image_routeur_r2en
docker build ./dockerfiles/R3 -t image_routeur_r3
docker build ./dockerfiles/R4 -t image_routeur_r4
docker build ./dockerfiles/PRIVE_ENTREPRISE/SERVEUR -t image_serv_dhcp 
docker build ./dockerfiles/PRIVE_ENTREPRISE/MACHINE1 -t image_machine_prive
docker build ./dockerfiles/BOX1 -t image_box1
docker build ./dockerfiles/BOX2 -t image_box2

