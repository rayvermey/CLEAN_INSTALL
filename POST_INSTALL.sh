#!/bin/bash

echo Installing AUR packages
pacman -Syu

for PACKAGE in /FILES/AUR_PACKAGES/*.zst 
do
	echo Installing ${PACKAGE}
	pacman  -U "${PACKAGE}" --needed --noconfirm
done

