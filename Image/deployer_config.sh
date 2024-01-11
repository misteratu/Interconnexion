#!/bin/sh

# Purge
docker network rm ReseauBackBone
docker network rm ReseauEntreprise
docker network rm ReseauClient
docker network rm ReseauService
docker network rm ReseauPrive1

# Construction des images à partir des dockerfiles
docker build ./dockerfiles/BOX1 -t image_routeur_box1
#docker build ./dockerfiles/BOX2 -t image_routeur_box2
docker build ./dockerfiles/PRIVEE/Machine1 -t image_routeur_privee_machine1
#docker build ./dockerfiles/PRIVEE/Machine2 -t image_routeur_privee_machine2
docker build ./dockerfiles/R1 -t image_routeur_r1
docker build ./dockerfiles/R1EN -t image_routeur_r1en
docker build ./dockerfiles/R2 -t image_routeur_r2
#docker build ./dockerfiles/R2EN -t image_routeur_r2en
docker build ./dockerfiles/R3 -t image_routeur_r3
docker build ./dockerfiles/R4 -t image_routeur_r4
docker build ./dockerfiles/DNS_n7 -t image_dns
docker build ./dockerfiles/VOIP -t image_voip

# Création des containers

docker create --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_box1 image_routeur_box1
#docker create --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_box2 image_routeur_box2
docker create --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_privee_machine1 image_routeur_privee_machine1
#docker create --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_privee_machine2 image_routeur_privee_machine2
docker create --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_r1 image_routeur_r1
docker create --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_r1en image_routeur_r1en
docker create --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_r2 image_routeur_r2
#docker create --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_r2en image_routeur_r2en
docker create --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_r3 image_routeur_r3
docker create --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_r4 image_routeur_r4
docker create --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_dns image_dns
docker create --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN --name container_voip image_voip

# Démarrage des containers

docker start container_box1
#docker start container_box2
docker start container_privee_machine1
#docker start container_privee_machine2
docker start container_r1
docker start container_r1en
docker start container_r2
#docker start container_r2en
docker start container_r3
docker start container_r4
docker start container_dns
docker start container_voip

# Création des Réseaux docker (bridge)

docker network create --subnet=120.0.46.0/23 --driver=bridge ReseauBackBone
docker network create --subnet=120.0.40.0/22 --driver=bridge ReseauEntreprise
docker network create --subnet=120.0.32.0/21 --driver=bridge ReseauClient
docker network create --subnet=120.0.44.0/23 --driver=bridge ReseauService
docker network create --subnet=192.168.198.0/24 --driver=bridge ReseauPrive1

# Connexion réseaux

docker network connect ReseauClient container_box1
docker network connect ReseauPrive1 container_box1
docker network connect ReseauBackBone container_r1
docker network connect ReseauEntreprise container_r1en
docker network connect ReseauBackBone container_r2
docker network connect ReseauService container_r2
docker network connect ReseauBackBone container_r3
docker network connect ReseauClient container_r3
docker network connect ReseauBackBone container_r4
docker network connect ReseauEntreprise container_r4
docker network connect ReseauPrive1 container_privee_machine1
docker network connect ReseauService container_dns
docker network connect ReseauService container_voip
