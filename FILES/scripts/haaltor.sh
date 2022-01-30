cd /home/ray/scripts

#DATE=`date "+%Y-%m-%d"`
mv TORRENTS.list TORRENTS.list.org

curl -S https://distrowatch.com/dwres.php?resource=bittorrent > torrtemp 2>/dev/null
#grep -B 1 $DATE torrtemp | sed 's/^.*dwres//' | sed 's/".*$//' | grep -v torrentdate | grep -v "\-\-" > tordown

grep ".torrent" torrtemp | grep ".iso" | sed 's/^.*dwres//' | sed 's/".*$//' | grep -v torrentdate | grep -v "\-\-" > TORRENTS.list 
diff TORRENTS.list TORRENTS.list.org | grep torrent | cut -c3-140 > tordown

while read TORRENT
do
	wget --no-check-certificate -nc -P /DATA/VMS/ISOS/ https://distrowatch.com/dwres/$TORRENT
done < tordown
