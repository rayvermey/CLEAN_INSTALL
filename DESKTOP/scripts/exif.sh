for f in  *.JPG
do
	JAAR=`exif -t=0x0132 $f | grep Value | cut -c10-13`
	MAAND=`exif -t=0x0132 $f | grep Value| cut -c15-16`
	DAG=`exif -t=0x0132 $f | grep Value| cut -c18-19`
	if [ $JAAR -gt 1000 ]
	then
	   mkdir -p $JAAR/$MAAND/$DAG
	   mv "$f" $JAAR/$MAAND/$DAG
	fi
done
