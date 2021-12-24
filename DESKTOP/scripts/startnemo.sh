nemo &
sleep 2
for ID in `xdotool search --name nemo`
do
        bspc node $ID -d E
	bspc desktop -f E
done

