for f in *.mp4
do
	JAAR=`echo $f|cut -c1-4`
	MAAND=`echo $f|cut -c6-7`
	DAG=`echo $f|cut -c9-10`
	if [ -d /data/Photos/$JAAR/$MAAND/$DAG ]
	then
		mv "$f" /data/Photos/$JAAR/$MAAND/$DAG
	else
		echo GAAN WE MAKEN
		mkdir -p /data/Photos/$JAAR/$MAAND/$DAG
	fi
done
