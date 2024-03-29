echo Freeing System
umount /dev/sda1
sleep 2
umount /dev/sda3
sleep 2
umount /dev/sda3
sleep 2
umount /dev/sda4
sleep 2
swapoff /dev/sda2
sleep 2

echo Setting vi
ln -s /usr/bin/vim /usr/bin/vi

echo Partitioning disk
sgdisk --zap-all /dev/sda
sleep 2
sfdisk --delete /dev/sda
sleep 2

cat << EOF > vda.layout
label: dos
label-id: 0x0b42f1b9
device: /dev/sda
unit: sectors
sector-size: 512

/dev/sda1 : start=        2048, size=     4194304, type=82
/dev/sda2 : start=     4196352, size=    83886080, type=83,bootable
/dev/sda3 : start=    88082432, size=   224499376, type=83
EOF

sfdisk /dev/sda < vda.layout
fdisk -l

echo Swap
mkswap /dev/sda1
swapon /dev/sda1

echo Formatting disks
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3

echo Mounting
mount /dev/sda2 /mnt
mkdir /mnt/home
mount /dev/sda3 /mnt/home
cp -ax / /mnt
cp mkinitcpio.conf /mnt/etc
cp -vaT /run/archiso/bootmnt/arch/boot/$(uname -m)/vmlinuz-linux /mnt/boot/vmlinuz-linux
genfstab -U /mnt >> /mnt/etc/fstab

cp b43-firmware-6.30.163.46-1-any.pkg.tar.zst /mnt/root 
cp sudoers /mnt/etc

echo CHROOT
arch-chroot /mnt /bin/bash <<EOF
echo LOCALE and stuff
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
export LANG=en_US.UTF-8
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
ln -s /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
echo Arch-TEST > /etc/hostname
sed -i "/localhost/s/$/ Arch-VM" /etc/hosts
mkinitcpio -p linux
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

cp -r /FILES/rclone /home/ray/.config/rclone


mkdir JOTTA
cd JOTTA
tar xvf /FILES/jotta-cli-0.8.36055_linux_x86.tar
cp -r usr/* /usr
cp -r etc/* /etc
cd ..

cp /FILES/jottad.service /etc/systemd/system/
systemctl enable --now jottad.service

cp /FILES/rclone-mount.service /etc/systemd/system/
systemctl enable --now rclone-mount.service

systemctl enable --now sshd.service

ln -s /usr/bin/vim /usr/bin/vi
chown -R ray:ray /home/ray

mkdir -p /DATA/cloud/Jotta
chown -R ray:ray /DATA/

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

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

yay -S paru --noconfirm

yay --noconfirm -S yajl

git clone https://github.com/bakkeby/dusk
cd dusk
make
sudo make install

EOF


cp mirrorlist /mnt/etc/pacman.d/
