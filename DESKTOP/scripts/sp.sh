PROG=$1
DESKTOP=`wmctrl -l| grep $PROG | cut -d" " -f3`
echo $DESKTOP
xdotool search --desktop $DESKTOP  --name "${PROG}" windowactivate  
