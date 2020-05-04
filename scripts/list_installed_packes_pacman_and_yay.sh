echo pacman -Qetq > packages.list
echo >> packages.list
pacman -Qetq >> packages.list
echo >> packages.list
echo YAY pacman -Qmq >> packages.list
echo >> packages.list
yay -Qmq >> packages.list
