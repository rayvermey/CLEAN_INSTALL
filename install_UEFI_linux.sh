if [ $(lsblk|grep disk|grep vda|sed 's/ .*$//') == vda ]
then
	DISK=vda
else
	DISK=sda
fi

echo Freeing System
umount -R /dev/${DISK}2
sleep 2
umount -R /dev/${DISK}3
sleep 2
umount -R /mnt
sleep 2
df

echo Setting vi
ln -s /usr/bin/vim /usr/bin/vi

MEMTOTAL=$(grep MemTotal /proc/meminfo | awk ' { print $2 }')

echo Partitioning disk
sgdisk --zap-all /dev/$DISK
sleep 2
sfdisk --delete /dev/$DISK
sleep 2

fdisk /dev/$DISK <<EOF
g
n
p


+500M
t
1
n


+${MEMTOTAL}k
t

19
n


+30G
t

20
n



t

28
w
EOF

fdisk -l

echo Swap
mkswap /dev/${DISK}2
swapon /dev/${DISK}2

echo Formatting disks
mkfs.fat -F 32 /dev/${DISK}1
mkfs.ext4 -F /dev/${DISK}3
mkfs.ext4 -F /dev/${DISK}4

echo Mounting
mount /dev/${DISK}3 /mnt
mkdir /mnt/home
mount /dev/${DISK}4 /mnt/home
mkdir /mnt/efi
mount /dev/${DISK}1 /mnt/efi
echo Copying files
cp -ax / /mnt
cp mkinitcpio.conf /mnt/etc
cp -vaT /run/archiso/bootmnt/arch/boot/$(uname -m)/vmlinuz-linux /mnt/boot/vmlinuz-linux
sleep 2
genfstab -U /mnt >> /mnt/etc/fstab

cp sudoers /mnt/etc
cp yay-11.0.2-1-x86_64.pkg.tar.zst /mnt
cp rclone.conf /mnt


echo Going CHROOT
arch-chroot /mnt /bin/bash <<EOF >LOG 2>&1
pacman -Syu --noconfirm

echo LOCALE and stuff
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
export LANG=en_US.UTF-8
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
ln -s /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
echo Arch-TEST > /etc/hostname
sed -i "/localhost/s/$/ Arch-VM" /etc/hosts
echo "root:qazwsx12" | chpasswd

echo Adding user Ray
groupadd -r autologin
useradd -G autologin,wheel,power -m ray
echo "ray:qazwsx12" | chpasswd
cat <<SU >> /etc/sudoers
## Same thing without a password
ray ALL=(ALL) NOPASSWD: ALL
SU

echo Chowning Ray
chown -R ray:ray /home/ray
sleep 2

echo Pacman Keys
pacman-key --init 
sleep 3
pacman-key --populate archlinux
sleep 3
sudo pacman -Syu --noconfirm
sleep 2


echo Installing yay

pacman -U yay-11.0.2-1-x86_64.pkg.tar.zst --noconfirm

echo Preparing Jotta and Rclone
pacman -S rclone --noconfirm
sleep 2

mkdir -p /DATA/cloud/Jotta
mkdir -p /home/ray/.config
mkdir -p /home/ray/.config/rclone/

chown -R ray:ray /home/ray
cp /rclone.conf /home/ray/.config/rclone

echo installing Jotta-cli

su ray -c 'yay -S jotta-cli --noconfirm'
sleep 5

mkdir -p /DATA/cloud/Jotta
mkdir -p /MEDIA/Jotta_Photos
chown -R ray:ray /DATA/
chown -R ray:ray /MEDIA/

#echo Copying Jotta files

#mkdir JOTTA
#cd JOTTA
#tar xvf /FILES/jotta-cli-0.8.36055_linux_x86.tar
#cp -r usr/* /usr
#cp -r etc/* /etc
#cd ..


sudo chown -R jottad /var/lib/jottad

cp /FILES/jottad.service /etc/systemd/system/
systemctl enable --now jottad.service

cp /FILES/rclone-mount.service /etc/systemd/system/
cp /FILES/rclone-mount-photos.service /etc/systemd/system/

echo Enabling rclone services

systemctl enable --now rclone-mount.service
systemctl enable --now rclone-mount-photos.service

systemctl enable --now sshd.service

ln -s /usr/bin/vim /usr/bin/vi

echo cleaning up

sed -i 's/Storage=volatile/#Storage=auto/' /etc/systemd/journald.conf
rm /etc/udev/rules.d/81-dhcpcd.rules
systemctl disable pacman-init.service choose-mirror.service
rm -r /etc/systemd/system/{choose-mirror.service,pacman-init.service,etc-pacman.d-gnupg.mount,getty@tty1.service.d}
rm /etc/systemd/scripts/choose-mirror
rm /etc/systemd/system/getty@tty1.service.d/autologin.conf
rm /root/{.automated_script.sh,.zlogin}
rm /etc/mkinitcpio-archiso.conf
rm -r /etc/initcpio

echo mkinitcpio

mkinitcpio -P

echo Installing grub

grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg

echo installing paru

su ray -c 'yay -S paru-bin --noconfirm'

echo Installing dusk

su ray -c 'yay --noconfirm -S yajl'
su ray -c 'yay --noconfirm -S imlib2'

git clone https://github.com/bakkeby/dusk
cd dusk
make
sudo make install

pacman -S gimp picom vivaldi sxhkd copyq transmission-gtk bash-completion dunst variety syncthing telegram-desktop caprine discord feh flameshot spice --noconfirm 
#su ray -c 'yay -S autokey whatsapp-nativefier kalu insync spacefm slack tweetdeck nomachine spotify-legacy ncspot --noconfirm'


EOF

echo moving dusk

cp mirrorlist /mnt/etc/pacman.d/
cp rclone-mount* /mnt/etc/systemd/system
mkdir /mnt/home/ray/git
mv /mnt/dusk /mnt/home/ray/git


