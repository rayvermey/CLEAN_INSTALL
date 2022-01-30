for f in  [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] *.png
do
	JAAR=`echo $f| cut -c1-4`
	MAAND=`echo $f| cut -c6-7`
	DAG=`echo $f| cut -c9-10`
	mkdir -p $JAAR/$MAAND/$DAG
	mv "$f" $JAAR/$MAAND/$DAG
done
