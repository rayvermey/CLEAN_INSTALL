MONS=`xrandr | grep -i " connected" | cut -d" " -f1 | wc -l` 
echo $MONS
