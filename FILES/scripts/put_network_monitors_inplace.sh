for ID in `xdotool search --name gotop`
do
        bspc node $ID -d 1
done
for ID in `xdotool search --name nload`
do
        bspc node $ID -d 1
done

for ID in `xdotool search --name iftop`
do
        bspc node $ID -d 1
done

