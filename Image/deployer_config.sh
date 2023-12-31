#!/bin/sh
# construction des images à partir des dockerfiles
docker build ./dockerfiles/R1AS -t image_routeur_r1as
docker build ./dockerfiles/R2 -t image_routeur_r2
docker build ./dockerfiles/R2EN -t image_routeur_r2en
docker build ./dockerfiles/R2EX -t image_routeur_r2ex
docker build ./dockerfiles/R3 -t image_routeur_r3
docker build ./dockerfiles/PRIVE_ENTREPRISE/SERVEUR -t image_serv_dhcp 
docker build ./dockerfiles/PRIVE_ENTREPRISE/MACHINE1 -t image_machine_prive
docker build ./dockerfiles/WEB -t image_web
docker build ./dockerfiles/BOX1 -t image_box1
docker build ./dockerfiles/BOX2 -t image_box2