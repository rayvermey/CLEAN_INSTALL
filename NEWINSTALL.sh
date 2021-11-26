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
sleep 2
mount /dev/sda3 /mnt/home


echo Pacstrap
pacstrap /mnt base base-devel linux linux-firmware vim grub efibootmgr os-prober openssh dhclient networkmanager

echo FSTAB
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab

mkdir /mnt/FILES
cp -r /FILES/* /mnt/FILES/

echo CHROOT
arch-chroot /mnt /bin/bash <<EOF
echo LOCALE and stuff
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
export LANG=en_US.UTF-8
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
ln -s /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
echo Arch-VM > /etc/hostname
sed -i "/localhost/s/$/ Arch-VM" /etc/hosts
mkinitcpio -p linux
echo "root:qazwsx12" | chpasswd

echo Installing Bootloader
pacman --noconfirm -S grub
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

echo INSTALLING Window Manager DUSK offcourse
pacman -Syy
pacman -S xorg xorg-server xorg-apps xorg-xinit dmenu rofi alacritty termite --noconfirm --needed
pacman -S noto-fonts ttf-ubuntu-font-family ttf-dejavu ttf-freefont terminus-font ttf-font-awesome --noconfirm --needed  
pacman -S alsa-utils alsa-plugins alsa-lib pavucontrol picom variety feh --noconfirm --needed
cd FILES/dusk
make
sudo make install

echo Adding user Ray
groupadd -r autologin
useradd -G autologin,wheel,power -m ray
echo "ray:qazwsx12" | chpasswd
cat <<SU >> /etc/sudoers
## Same thing without a password
ray ALL=(ALL) NOPASSWD: ALL
SU

echo Installing needed tools
pacman -S gparted git zsh chromium vivaldi bash-completion zsh-completions --noconfirm --needed
echo Installing YAY
git clone https://aur.archlinux.org/yay.git
chmod 777 yay
cd yay
su ray -c "makepkg -si --noconfirm"


echo INstalling AUR packages

su ray -c "yay -S jotta-cli alias-tips-git autojump autokey-common autokey-gtk downgrade gconf gitahead-bin gtk-theme-config insync nerd-fonts-hack otf-font-awesome-4 p7zip-gui pamac-all pcloud-drive pkgbrowser snapd snapd-glib spice-vdagent  wttr  --noconfirm"

echo Preparing Jotta & Rclone

cp /root/ai.sh /mnt

mkdir -p /DATA/cloud/Jotta
mkdir -p /home/ray/.config

pacman -S rclone --noconfirm

#cp -r /FILES/rclone /home/ray/.config/rclone


mkdir JOTTA
cd JOTTA
tar xvf /FILES/jotta-cli-0.8.36055_linux_x86.tar
cp -r usr/* /usr
cp -r etc/* /etc
cd ..

cp /FILES/jottad.service /etc/systemd/system/
systemctl enable --now jottad.service

cp /FILES/rclone-mount.service /etc/systemd/system/
#systemctl enable --now rclone-mount.service

systemctl enable --now sshd.service

echo Setting autologin
#cp /FILES/lightdm.conf /etc/lightdm

cp /FILES/picom.conf /home/ray/.config

picom --config /home/ray/.config/picom.conf -b
ln -s /usr/bin/vim /usr/bin/vi
chown -R ray:ray /home/ray

mkdir -p /DATA/cloud/Jotta
chown -R ray:ray /DATA/
EOF

