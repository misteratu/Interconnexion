#!/bin/bash


# interfaces

ip link add eth1 type veth peer name eth2 type veth

ip link set dev eth1 up
#ip addr add flush dev eth0

# adresses

ip addr add 120.0.40.3/22 dev eth1

# quagga

/etc/init.d/zebra start
/etc/init.d/ospfd start




#On ne met pas masquerade, on SNAT à la main, car serveur web user est pas à l'extérieur donc masque pas la demande de PC1 alors qu'elle devrait
iptables -t nat -A POSTROUTING -j SNAT -o eth1 --to-source 120.0.40.3





#DROP tout
#iptables --policy FORWARD DROP
#iptables --policy INPUT DROP
#iptables --policy OUTPUT DROP
  
#accepte de forward (et donc input, car nat) les reponses vers le réseau privé
#iptables -d 192.168.198.0/24 -A FORWARD -m conntrack --ctstate ESTABLISHED -j ACCEPT
#iptables -d 192.168.171.128/25 -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT
#accepte de forward (donc output car nat) les requestes du privé vers la DMZ
#iptables -s 192.168.171.128/25 -A FORWARD -j ACCEPT
#accepte input de l'interieur car box .... ?
#iptables -s 192.168.171.128/25 -A INPUT -j ACCEPT
#passurquecesoitnecessaire la ligne pré
#accepte de FORWARD (donc OUTPUT) à detination de la DMZ car nat
#iptables -d 8.25.5.0/24 -A OUTPUT -j ACCEPT

#ajout d'accept et de redirection pour le serveur web privé
#iptables -i eth1 -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to 192.168.198.3:80
#iptables -i eth0 -d 120.0.40.3 -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to 192.168.198.3:80
#iptables -i eth1 -p tcp --dport 80 -A FORWARD -j ACCEPT
#iptables -i eth1 -p tcp --dport 80 -A INPUT -j ACCEPT

############# ASUPPRIMER SI ON NE VEUT PLUS PING SITEWEB ########
#accepte de transmettre icmp vers la dmz pour le ping vers le DNS
#iptables -p icmp -s 192.168.171.128/25 -A FORWARD -j ACCEPT
#accepte le ping des autres utilisateurs, on aurait pu mettre directement  8.25.5.0/26
#iptables -p icmp -s 8.25.5.3 -A INPUT -j ACCEPT
#iptables -p icmp -j ACCEPT -A OUTPUT -s 8.25.5.2
#ouptut ici car masque la source

#pour pouvoir traceroute depuis la box
#
#iptables -p icmp -A OUTPUT -s 8.25.5.2 -j ACCEPT
#iptables -p icmp -A INPUT -d 8.25.5.2 -j ACCEPT

#####si pour limiter, on utilise dport fosi le nombre d'etapes possibles du reseau
#iptables -p udp --dport 33434 -A OUTPUT -j ACCEPT
#iptables -p udp --dport 33434 -A INPUT -j ACCEPT
#iptables -p udp --dport 33435 -A INPUT -j ACCEPT
#iptables -p udp --dport 33436 -A INPUT -j ACCEPT
#iptables -p udp --dport 33437 -A INPUT -j ACCEPT
#iptables -p udp --dport 33438 -A INPUT -j ACCEPT
#
#pas forward car box en bout de chaine





# boucle infinie pour garder le container ouvert

while true; do sleep 1000; done