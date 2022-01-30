DEST=/DATA/cloud/Jotta/CLEAN_INSTALL/DESKTOP
pacman -Qentq >> packages_repo.list
yay -Qmq >> packages_aur.list
mv packages_repo.list $DEST
mv packages_aur.list $DEST



#pacman -Qqen > pkglist-repo.txt
#pacman -Qqem > pkglist-aur.txt

#sudo su
#for x in $(cat pkglist-repo.txt); do pacman -S --needed $x; done
#yay -S --needed --nouseask $(< pkglist-aur.txt)
