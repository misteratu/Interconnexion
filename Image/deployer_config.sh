#!/bin/sh
# construction des images à partir des dockerfiles
docker build ./dockerfiles/BOX1 -t image_routeur_box1
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
docker network create --subnet=120.0.46.0/23 --driver=bridge ReseauBackBone
docker network create --subnet=120.0.40.0/22 --driver=bridge ReseauEntreprise
docker network create --subnet=120.0.32.0/21 --driver=bridge ReseauClient
docker network create --subnet=120.0.44.0/23 --driver=bridge ReseauService

docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_box1 image_routeur_box1 --network ReseauClient
#docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_box2 image_routeur_box2 --network ReseauClient
#docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_privee_machine1 image_routeur_privee_machine1 --network ReseauClient
#docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_privee_machine2 image_routeur_privee_machine2 --network ReseauClient
docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_r1 image_routeur_r1 --network ReseauBackBone
docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_r1en image_routeur_r1en --network ReseauEntreprise
docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_r2 image_routeur_r2 --network ReseauBackBone
#docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_r2en image_routeur_r2en --network ReseauEntreprise
docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_r3 image_routeur_r3 --network ReseauClient
docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_r4 image_routeur_r4 --network ReseauBackBone
docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_dns image_dns --network ReseauService

# Création interfaces
docker network connect --ip 120.0.32.2 --alias eth0 ReseauClient container_box1
docker network connect --ip 120.0.46.1 --alias eth0 ReseauClient container_r1
docker network connect --ip 120.0.40.3 --alias eth0 ReseauClient container_r1en
docker network connect --ip 120.0.46.2 --alias eth0 ReseauClient container_r2
docker network connect --ip 120.0.40.1 --alias eth1 ReseauClient container_r2
docker network connect --ip 120.0.46.3 --alias eth0 ReseauClient container_r3
docker network connect --ip 120.0.32.1 --alias eth1 ReseauClient container_r3
docker network connect --ip 120.0.46.4 --alias eth0 ReseauClient container_r4
docker network connect --ip 120.0.40.1 --alias eth1 ReseauClient container_r4
