sudo umount  /DATA/cloud/Jotta
sleep 2
sudo umount  /MEDIA/Jotta_Photos
sleep 2
systemctl restart  rclone-mount
sleep 2
systemctl restart  rclone-mount-photos
sleep 2
killall -9 pcloud 
sleep 2
