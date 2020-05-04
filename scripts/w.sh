#!/bin/sh
prog1=firefox
class1=navigator
site1=www.linux.org
dis1=1 #Workspace 2
prog2=gedit
class2=gedit
dis2=2 #Workspace 3
prog3=gnome-terminal
class3=gnome-terminal
dis3=3 #Workspace 4
echo "Starting $prog1."
echo " "
$prog1 $site1 2>/dev/null &
sleep 2
wid1=$(xdotool search --classname $class1)
echo "*********************************************"
echo "Window ID is:"
echo " "
echo $wid1
echo " "
echo "*********************************************"
a=$(($dis1 + 1)) # Sets value for real Workspace Number
echo "Moving $prog1 to workspace $a."
xdotool set_desktop_for_window $wid1 $dis1
echo "Starting $prog2."
echo " "
$prog2 &
b=$!
sleep 2
wid2=$(xdotool search --pid $b 2>/dev/null)
wid2=$(echo $wid2 | rev | cut -d' ' -f 1 | rev)
echo "*********************************************"
echo "Window ID is:"
echo " "
echo $wid2
echo " "
echo "*********************************************"
a=$(($dis2 + 1)) # Sets value for real Workspace Number
echo "Moving $prog2 to workspace $a."
xdotool set_desktop_for_window $wid2 $dis2echo "Starting $prog3."
echo " "
$prog3 2>/dev/null &
sleep 2
wid3=$(xdotool search --classname $class3)
wid3=$(echo $wid3 | rev | cut -d' ' -f 1 | rev)
echo "*********************************************"
echo "Window ID is:"
echo " "
echo $wid3
echo " "
echo "*********************************************"
a=$(($dis3 + 1)) # Sets value for real Workspace Number
echo "Moving $prog3 to workspace $a."
xdotool set_desktop_for_window $wid3 $dis3
