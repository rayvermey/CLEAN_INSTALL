!/usr/bin/sh

cmd=$(ls -1 /home/ray/.config/themes | dmenu -l 10 -fn "Arial-14" -p "Chose your theme" $*)

sed  -i 's/^#/!#/' /home/ray/.Xresources
sed -i -e '/'$cmd'/s/^!#/#/' /home/ray/.Xresources

xrdb ~/.Xresources && duskc run_command xrdb
