wget https://linuxtracker.org | grep iso.torrent

grep id= index.html  | cut -d\; -f3 | sed 's/".*$//' | grep -v \< | sort -u > TORRENTS2


for TORRENT in `cat TORRENTS2`
do
wget https://linuxtracker.org/download.php?$TORRENT
NAME=`strings download.php?$TORRENT | grep \.iso | grep creation | sed 's/^.*name[0-9]*://' | sed 's/:.*$//'`
echo $NAME
mv download.php?$TORRENT /home/ray/Downloads/$NAME.torrent
done
