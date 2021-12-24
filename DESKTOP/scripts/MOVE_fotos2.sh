for f in *.tif
do
	DATE=`identify -verbose "$f" | grep "Date Time:"` 
	JAAR=`echo $DATE|cut -c12-15`
	MAAND=`echo $DATE|cut -c17-18`
	DAG=`echo $DATE|cut -c20-21`
	if [ -d /data/Photos/$JAAR/$MAAND/$DAG ]
	then
		mv "$f" /data/Photos/$JAAR/$MAAND/$DAG
	else
		mkdir /data/Photos/$JAAR/$MAAND/$DAG
		mv "$f" /data/Photos/$JAAR/$MAAND/$DAG
	fi
done

