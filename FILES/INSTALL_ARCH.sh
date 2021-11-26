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

echo Mirrors
#reflector -c NL > /etc/pacman.d/mirrorlist
pacman -Syy

echo Partitioning disk
sgdisk --zap-all /dev/sda
sleep 2
sfdisk --delete /dev/sda
sleep 2

cat << EOF > vda.layout
label: gpt
label-id: F5D68989-9C99-F243-BF28-BFC9C596949D
device: /dev/sda
unit: sectors
first-lba: 2048
last-lba: 104857566
sector-size: 512

/dev/sda1 : start=        2048, size=      409600, type=U
/dev/sda2 : start=      411648, size=     4194304, type=S
/dev/sda3 : start=     4605952, size=    52428800, type=L
/dev/sda4 : start=    57034752, size=    47822815, type=H
EOF

sfdisk /dev/sda < vda.layout
fdisk -l

echo Swap
mkswap /dev/sda2
swapon /dev/sda2

echo Formatting disks
mkfs.fat -F 32 /dev/sda1
mkfs.ext4 -F -F /dev/sda3
mkfs.ext4 -F -F /dev/sda4

echo Mounting
mount /dev/sda3 /mnt
mkdir /mnt/boot
mkdir /mnt/home
mount /dev/sda1 /mnt/boot
sleep 2
mount /dev/sda4 /mnt/home


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
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB-EFI
grub-mkconfig -o /boot/grub/grub.cfg

echo INSTALLING Window Manager DUSK offcourse
pacman -Syy
pacman -S xorg xorg-server xorg-apps xorg-xinit dmenu rofi termite --noconfirm --needed
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
