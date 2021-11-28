if [ $(lsblk|grep disk|grep vda|sed 's/ .*$//') == vda ]
then
	DISK=vda
else
	DISK=sda
fi

echo Freeing System
umount /dev/${DISK}2
sleep 2
umount /dev/${DISK}3
sleep 2

echo Setting vi
ln -s /usr/bin/vim /usr/bin/vi

echo Partitioning disk
sgdisk --zap-all /dev/$DISK
sleep 2
sfdisk --delete /dev/$DISK
sleep 2

read A

fdisk /dev/$DISK <<EOF
o
n
p


+2G
t
82
n
p


+45G
t

83
n




t

83
a
2
w
EOF

fdisk -l


echo Swap
mkswap /dev/${DISK}1
swapon /dev/${DISK}1

echo Formatting disks
mkfs.ext4 -F /dev/${DISK}2
mkfs.ext4 -F /dev/${DISK}3

echo Mounting
mount /dev/${DISK}2 /mnt
mkdir /mnt/home
mount /dev/${DISK}3 /mnt/home
cp -ax / /mnt
cp mkinitcpio.conf /mnt/etc
cp -vaT /run/archiso/bootmnt/arch/boot/$(uname -m)/vmlinuz-linux /mnt/boot/vmlinuz-linux
genfstab -U /mnt >> /mnt/etc/fstab

cp b43-firmware-6.30.163.46-1-any.pkg.tar.zst /mnt/root 
cp sudoers /mnt/etc

echo CHROOT
arch-chroot /mnt /bin/bash <<EOF >LOG 2>&1
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

git clone https://aur.archlinux.org/yay.git
chmod 777 yay
cd yay
su ray -c "makepkg -si --noconfirm"

echo Preparing Jotta & Rclone

cp /root/ai.sh /mnt

mkdir -p /DATA/cloud/Jotta
mkdir -p /home/ray/.config
mkdir -p /home/ray/.config/rclone/

cp -r configs_general/rclone.conf /home/ray/.config/rclone


mkdir -p /DATA/cloud/Jotta
chown -R ray:ray /DATA/

mkdir JOTTA
cd JOTTA
tar xvf /FILES/jotta-cli-0.8.36055_linux_x86.tar
cp -r usr/* /usr
cp -r etc/* /etc
cd ..

yay -S jotta-cli --needed --noconfirm

sudo chown -R jottad /var/lib/jottad

cp /FILES/jottad.service /etc/systemd/system/
systemctl enable --now jottad.service

cp /FILES/rclone-mount.service /etc/systemd/system/
systemctl enable --now rclone-mount.service

systemctl enable --now sshd.service

ln -s /usr/bin/vim /usr/bin/vi
chown -R ray:ray /home/ray

sed -i 's/Storage=volatile/#Storage=auto/' /etc/systemd/journald.conf
rm /etc/udev/rules.d/81-dhcpcd.rules
systemctl disable pacman-init.service choose-mirror.service
rm -r /etc/systemd/system/{choose-mirror.service,pacman-init.service,etc-pacman.d-gnupg.mount,getty@tty1.service.d}
rm /etc/systemd/scripts/choose-mirror
rm /etc/systemd/system/getty@tty1.service.d/autologin.conf
rm /root/{.automated_script.sh,.zlogin}
rm /etc/mkinitcpio-archiso.conf
rm -r /etc/initcpio
#rmmod b43
#rmmod wl
#pacman -U b43-firmware-6.30.163.46-1-any.pkg.tar.zst 
#sleep 5
#modprobe wl
#modprobe b43
#sleep 5
#WLAN=$(ip a| grep wlan| cut -d: -f2)
#ip a
#iwctl --passphrase=Dunnepoes01! station $WLAN connect Deco
#sleep 5
pacman-key --init
pacman-key --populate archlinux
mkinitcpio -P

grub-install /dev/$DISK
grub-mkconfig -o /boot/grub/grub.cfg

yay -S paru --noconfirm

yay --noconfirm -S yajl

git clone https://github.com/bakkeby/dusk
cd dusk
make
sudo make install

EOF


cp mirrorlist /mnt/etc/pacman.d/
