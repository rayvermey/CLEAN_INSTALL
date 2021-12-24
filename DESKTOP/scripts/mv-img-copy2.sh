for f in  IMG-????????-*.jpeg
do
	JAAR=`echo $f| cut -c5-8`
	MAAND=`echo $f| cut -c9-10`
	DAG=`echo $f| cut -c11-12`
	mkdir -p "/home/ray/pCloudDrive/My\ Pictures/$JAAR/$MAAND/$DAG"
	echo mv $f "/home/ray/pCloudDrive/My\ Pictures/$JAAR/$MAAND/$DAG"
done
