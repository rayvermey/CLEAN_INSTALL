echo pacman -Qetq > packages.list
echo >> packages.list
pacman -Qetq >> packages.list
echo >> packages.list
echo YAY pacman -Qmq >> packages.list
echo >> packages.list
yay -Qmq >> packages.list



#pacman -Qqen > pkglist-repo.txt
#pacman -Qqem > pkglist-aur.txt

#sudo su
#for x in $(cat pkglist-repo.txt); do pacman -S --needed $x; done
#yay -S --needed --nouseask $(< pkglist-aur.txt)
