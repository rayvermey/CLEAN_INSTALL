#grep ".torrent" TT | grep ".iso" | sed 's/^.*dwres//' | sed 's/".*$//' | grep -v torrentdate | grep -v "\-\-" > tordown
#exit 0
while read TORRENT
do
	wget --no-check-certificate -nc -P /home/ray/Downloads/ISOS/ https://distrowatch.com/dwres/$TORRENT
done < tordown
