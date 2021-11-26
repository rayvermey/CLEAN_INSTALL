PID=$1
WINDOWLIST=$(xdotool search $1)
for WINDOW in $WINDOWLIST
do
	xdotool windowactivate $WINDOW
done

