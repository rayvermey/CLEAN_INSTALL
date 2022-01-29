echo Going CHROOT
arch-chroot /mnt /bin/bash <<EOF >LOG 2>&1

echo Installing AUR packages
pacman -Syu

for PACK in /FILES/AUR_PACKAGES/*.zst
do
	echo $PACK
	pacman  -U $PACK
done

EOF
