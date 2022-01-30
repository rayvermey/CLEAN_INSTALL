sudo pacman -Syu

#git clone https://aur.archlinux.org/yay
#cd yay
#makepkg -si 
#echo YAY installed
#read a

for PACKAGE in $(cat LAPTOP/LAPTOP_PACMAN_PACKAGES.lst)
do
	sudo pacman -S --noconfirm --needed $PACKAGE
done

echo pacman installed
read a

for PACKAGE in $(cat LAPTOP/LAPTOP_AUR_PACKAGES.lst)
do
	yay -S --noconfirm --needed $PACKAGE
done

echo yay installed
read a

cp -r /FILES/configs/filezilla /home/ray/.config/
cp -r /FILES/configs/filezilla /home/ray/.config/
