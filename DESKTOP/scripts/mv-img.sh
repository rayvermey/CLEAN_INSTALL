for f in  IMG-????????-*.jpg
do
	JAAR=`echo $f| cut -c5-8`
	MAAND=`echo $f| cut -c9-10`
	DAG=`echo $f| cut -c11-12`
	mkdir -p "/MEDIA/photos/$JAAR/$MAAND/$DAG"
	mv $f "/MEDIA/photos/$JAAR/$MAAND/$DAG"
done
