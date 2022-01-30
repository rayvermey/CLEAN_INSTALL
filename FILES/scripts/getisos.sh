#hhttp://cdimage.ubuntu.com/kubuntu/releases/19.04/release/kubuntu-19.04-desktop-amd64.iso.torrent
#Ubuntu 
ubuntu=ftp://releases.ubuntu.com/releases/
release=`curl -l $ubuntu | sort -n -r | awk NR==1`
echo $release
#wget -r -nH --cut-dirs=3 --no-parent -A "*.torrent" $ubuntu/$release/ -P $torrent_location/
