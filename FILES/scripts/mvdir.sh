for DIR in `find . -type d -print`
do
	NDIR=`echo $DIR | sed 's/??-.*\///' | sed 's/Day-//' | sed 's/-[a-z]*//'`
	mkdir -p $NDIR
	echo mv $DIR $NDIR

done
