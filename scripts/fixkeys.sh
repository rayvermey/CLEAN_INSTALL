#!/bin/bash
#set -e
###############################################################################
# Author	:	Erik Dubois
# Website	:	https://www.erikdubois.be
# Website	:	https://www.arcolinux.info
# Website	:	https://www.arcolinux.com
# Website	:	https://www.arcolinuxd.com
# Website	:	https://www.arcolinuxb.com
# Website	:	https://www.arcolinuxforum.com
###############################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
###############################################################################

echo "###############################################################################"
echo "Removing the pacman databases"
echo "###############################################################################"
echo
sudo rm /var/lib/pacman/sync/*
echo

echo "###############################################################################"
echo "Removing /etc/pacman.d/gnupg files"
echo "###############################################################################"
echo
sudo rm -rf /etc/pacman.d/gnupg/*
echo

echo "###############################################################################"
echo "Initialize pacman keys"
echo "###############################################################################"
echo
sudo pacman-key --init
echo

echo "###############################################################################"
echo "Populating keyring"
echo "###############################################################################"
echo 
sudo pacman-key --populate
echo 

echo "###############################################################################"
echo "Getting new databases"
echo "###############################################################################"
echo 
sudo pacman -Sy
echo 

sudo pacman -S archlinux-keyring
echo "###############################################################################"
echo "###                               DONE                                     ####"
echo "###############################################################################"
