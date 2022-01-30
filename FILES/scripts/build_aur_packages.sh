for PACKAGE in $(cat /DATA/cloud/Jotta/NEW_INSTALL/DESKTOP/AURPKGS)
do
	echo Building $PACKAGE
	git clone https://aur.archlinux.org/$PACKAGE.git
	cd $PACKAGE
	makepkg
	cd ..
done
