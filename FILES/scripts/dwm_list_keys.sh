 grep "{ MODKEY" /home/ray/git/dwm-flexipatch/config.h | sed 's/MODKEY/Super/g' | sed 's/Mask//g' | sed 's/XK_/+ /g' | sed 's/Super|Mod4/Super/'
