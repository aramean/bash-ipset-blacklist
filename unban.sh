#!/bin/bash

#REMOVE FROM BLACKLIST
ex +g/$1/d -cwq /etc/ipset-blacklist.txt

#REMOVE FROM IPSET
sudo firewall-cmd --permanent --ipset=blacklist --remove-entry=$1

#RELOAD FIREWALL
sudo firewall-cmd --reload
