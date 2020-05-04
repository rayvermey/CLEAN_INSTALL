if ! pgrep -f bashtop
then
	termite -e "bashtop" &
fi
sleep 1
#if ! pgrep -f nload
#then
#	termite -e "nload wlp0s20f0u2" &
#fi
#sleep 1
if ! pgrep -f iftop
then
	sudo termite -e "iftop -i wlp0s20f0u2" &
fi
sleep 1
#/home/ray/scripts/put_network_monitors_inplace.sh
