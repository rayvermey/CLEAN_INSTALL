for f in  IMG_????????_*.jpg
do
	JAAR=`echo $f| cut -c5-8`
	MAAND=`echo $f| cut -c9-10`
	DAG=`echo $f| cut -c11-12`
	mkdir -p $JAAR/$MAAND/$DAG
	mv $f $JAAR/$MAAND/$DAG
done
