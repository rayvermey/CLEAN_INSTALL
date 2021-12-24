DEST=$(hostname)
rsync -uva --exclude pCloud --exclude pcloud --exclude .pcloud --exclude cache --exclude .cache --exclude Cache --exclude pCloudDrive /home/ray/ /home/ray/pCloudDrive/$DEST/Home_Ray/
