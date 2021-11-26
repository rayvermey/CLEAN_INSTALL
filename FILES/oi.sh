mount /dev/sda2 /mnt
mkdir /mnt/home
mount /dev/sda3 /mnt/home
cp -ax / /mnt
cp mkinitcpio.conf /mnt/etc
cp -vaT /run/archiso/bootmnt/arch/boot/$(uname -m)/vmlinuz-linux /mnt/boot/vmlinuz-linux
genfstab -U /mnt >> /mnt/etc/fstab

cp b43-firmware-6.30.163.46-1-any.pkg.tar.zst /mnt/root 
cp sudoers /mnt/etc
cp mirrorlist /mnt/etc/pacman.d/

arch-chroot /mnt <<EOF
pacman -Syy

ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
hwclock --systohc
locale-gen
sed -i 's/Storage=volatile/#Storage=auto/' /etc/systemd/journald.conf
rm /etc/udev/rules.d/81-dhcpcd.rules
systemctl disable pacman-init.service choose-mirror.service
rm -r /etc/systemd/system/{choose-mirror.service,pacman-init.service,etc-pacman.d-gnupg.mount,getty@tty1.service.d}
rm /etc/systemd/scripts/choose-mirror
rm /etc/systemd/system/getty@tty1.service.d/autologin.conf
rm /root/{.automated_script.sh,.zlogin}
rm /etc/mkinitcpio-archiso.conf
rm -r /etc/initcpio
rmmod b43
rmmod wl
pacman -U b43-firmware-6.30.163.46-1-any.pkg.tar.zst 
sleep 5
modprobe wl
modprobe b43
sleep 5
WLAN=$(ip a| grep wlan| cut -d: -f2)
ip a
iwctl --passphrase=Dunnepoes01! station $WLAN connect Deco
sleep 5
pacman-key --init
pacman-key --populate archlinux
mkinitcpio -P

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

git clone https://aur.archlinux.org/yay-git
cd yay-git
makepkg -si

yay -S paru --noconfirm

yay --noconfirm -S yajl

git clone https://github.com/bakkeby/dusk
cd dusk
make
sudo make install

EOF


