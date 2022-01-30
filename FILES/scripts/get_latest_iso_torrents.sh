	for TORRENT in `curl "https://distrowatch.com/weekly.php?issue=20201017" 2>/dev/null | grep iso | grep torrent | cut -d" " -f4 | sed "s/href=\"//" | sed "s/\">//"`
do
	echo Downloading $TORRENT
	wget -nc -P /home/ray/Downloads/ISOS/ $TORRENT
done

