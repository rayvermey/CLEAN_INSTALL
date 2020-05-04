virtualbox &
sleep 1
for ID in `xdotool search --name virtualbox`
do
        bspc node $ID -d C
	bspc desktop -f C
done

