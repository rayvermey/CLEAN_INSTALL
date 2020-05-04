for TORRENT in `curl "https://distrowatch.com/weekly.php?issue=20190422" 2>/dev/null | grep iso | grep torrent | cut -d" " -f4 | sed "s/href=\"//" | sed "s/\">//"`
do
	echo Downloading $TORRENT
	wget -nc -P /DATA_STATIC/ISOS/ $TORRENT
done

