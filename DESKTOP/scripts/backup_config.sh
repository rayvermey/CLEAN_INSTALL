DEST=($HOST)
cp /home/ray/.bash* /home/ray/pCloudDrive/$DEST/Home_Ray/
cp /home/ray/.alias* /home/ray/pCloudDrive/$DEST/Home_Ray/
cp /home/ray/.zsh* /home/ray/pCloudDrive/$DEST/Home_Ray/
rsync -ruv /home/ray/.config /home/ray/pCloudDrive/$DEST/Home_Ray/
