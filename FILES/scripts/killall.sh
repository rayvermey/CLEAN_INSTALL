 ps aux | grep  -i $1 | awk '{ print "kill " $2 } ' | sh -
