#!/bin/sh
# construction des images à partir des dockerfiles
docker build ./dockerfiles/BOX1 -t image_routeur_box1
docker build ./dockerfiles/BOX2 -t image_routeur_box2
docker build ./dockerfiles/PRIVEE/Machine1 -t image_routeur_privee_machine1
docker build ./dockerfiles/PRIVEE/Machine2 -t image_routeur_privee_machine2
docker build ./dockerfiles/R1 -t image_routeur_r1
docker build ./dockerfiles/R1EN -t image_routeur_r1en
docker build ./dockerfiles/R2 -t image_routeur_r2
docker build ./dockerfiles/R2EN -t image_routeur_r2en
docker build ./dockerfiles/R3 -t image_routeur_r3
docker build ./dockerfiles/R4 -t image_routeur_r4
docker build ../DockerFiles/DNS_n7 -t image_dns

docker run --cap-add=NET_ADMIN image_routeur_box1
docker run --cap-add=NET_ADMIN image_routeur_box2
docker run --cap-add=NET_ADMIN image_routeur_privee
docker run --cap-add=NET_ADMIN image_routeur_r1
docker run --cap-add=NET_ADMIN image_routeur_r1en
docker run --cap-add=NET_ADMIN image_routeur_r2
docker run --cap-add=NET_ADMIN image_routeur_r2en
docker run --cap-add=NET_ADMIN image_routeur_r3
docker run --cap-add=NET_ADMIN image_routeur_r4
docker run --cap-add=NET_ADMIN image_dns