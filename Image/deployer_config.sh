#!/bin/sh
# construction des images à partir des dockerfiles
#docker build ./dockerfiles/BOX1 -t image_routeur_box1
#docker build ./dockerfiles/BOX2 -t image_routeur_box2
#docker build ./dockerfiles/PRIVEE/Machine1 -t image_routeur_privee_machine1
#docker build ./dockerfiles/PRIVEE/Machine2 -t image_routeur_privee_machine2
docker build ./dockerfiles/R1 -t image_routeur_r1
docker build ./dockerfiles/R1EN -t image_routeur_r1en
docker build ./dockerfiles/R2 -t image_routeur_r2
#docker build ./dockerfiles/R2EN -t image_routeur_r2en
docker build ./dockerfiles/R3 -t image_routeur_r3
docker build ./dockerfiles/R4 -t image_routeur_r4
docker build ./dockerfiles/DNS_n7 -t image_dns

# Création des Réseaux docker (bridge)
docker network create --driver=bridge ReseauBackBone
docker network create --driver=bridge ReseauEntreprise
docker network create --driver=bridge ReseauClient
docker network create --driver=bridge ReseauService

#docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_box1 image_routeur_box1
#docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_box2 image_routeur_box2
#docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_privee_machine1 image_routeur_privee_machine1
#docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_privee_machine2 image_routeur_privee_machine2
docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_r1 image_routeur_r1
docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_r1en image_routeur_r1en
docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_r2 image_routeur_r2
#docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_r2en image_routeur_r2en
docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_r3 image_routeur_r3
docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_r4 image_routeur_r4
docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_dns image_dns

# Connection des containers aux réseaux de la backbone
docker network connect container_r2 eth1-cont
docker network connect container_r3 eth1-cont
docker network connect container_r4 eth1-cont
docker network connect ReseauBackBone container_r1
docker network connect ReseauBackBone container_r2
docker network connect ReseauBackBone container_r3
docker network connect ReseauBackBone container_r4

# Connection des containers aux réseaux de l'entreprise
docker network connect ReseauEntreprise container_r1en
#docker network connect ReseauEntreprise container_r2en
docker network connect ReseauEntreprise container_r4

# Connection des containers aux réseaux des clients
#docker network connect ReseauClient container_box1
#docker network connect ReseauClient container_box2
docker network connect ReseauClient container_r3

# Connection des containers aux réseaux des services
docker network connect ReseauService container_dns
docker network connect ReseauService container_r2