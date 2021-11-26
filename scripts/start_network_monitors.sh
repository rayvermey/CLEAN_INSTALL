if ! pgrep -f bashtop
then
	: #kitty -e "bashtop" &
fi
sleep 1
if ! pgrep -f rtorrent
then
	termite -e rtorrent &
fi
sleep 1
#/home/ray/scripts/put_network_monitors_inplace.sh
if ! pgrep -f iftop
then
	sudo termite -e "iftop -i enp7s0" &
	#sudo termite -e "iftop -i wlp0s20f0u2" &
fi
sleep 1
