#!/bin/sh
# construction des Image/dockerfiless à partir des Image/dockerfiles
docker build ./Image/dockerfiles/R1 -t Image/dockerfiles_routeur_r1
docker build ./Image/dockerfiles/R1EN -t Image/dockerfiles_routeur_r1en
docker build ./Image/dockerfiles/R2 -t Image/dockerfiles_routeur_r2
docker build ./Image/dockerfiles/R2EN -t Image/dockerfiles_routeur_r2en
docker build ./Image/dockerfiles/R3 -t Image/dockerfiles_routeur_r3
docker build ./Image/dockerfiles/R4 -t Image/dockerfiles_routeur_r4
docker build ./Image/dockerfiles/PRIVEE/Machine1 -t Image/dockerfiles_prive_machine1 
docker build ./Image/dockerfiles/PRIVEE/Machine2 -t Image/dockerfiles_prive_machine2
docker build ./Image/dockerfiles/BOX1 -t Image/dockerfiles_box1
docker build ./Image/dockerfiles/BOX2 -t Image/dockerfiles_box2

