#!/bin/sh
# construction des images à partir des dockerfiles
docker build ./dockerfiles/BOX1 -t image_routeur_box1
docker build ./dockerfiles/BOX2 -t image_routeur_box2
docker build ./dockerfiles/PRIVEE -t image_routeur_privee
docker build ./dockerfiles/R1 -t image_routeur_r1
docker build ./dockerfiles/R1EN -t image_routeur_r1en
docker build ./dockerfiles/R2 -t image_routeur_r2
docker build ./dockerfiles/R2EN -t image_routeur_r2en
docker build ./dockerfiles/R3 -t image_routeur_r3
docker build ./dockerfiles/R4 -t image_routeur_r4
docker build ../DockerFiles/DNS_n7 -t image_dns

docker run -d --name container_box1 image_routeur_box1
docker run -d --name container_box2 image_routeur_box2
docker run -d --name container_privee image_routeur_privee
docker run -d --name container_r1 image_routeur_r1
docker run -d --name container_r1en image_routeur_r1en
docker run -d --name container_r2 image_routeur_r2
docker run -d --name container_r2en image_routeur_r2en
docker run -d --name container_r3 image_routeur_r3
docker run -d --name container_r4 image_routeur_r4
docker run -d --name container_DNS_n7 image_dns