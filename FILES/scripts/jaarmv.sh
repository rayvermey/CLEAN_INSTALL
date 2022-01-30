for f in `ls -1 $1*_*.jpg`
do
	DATUM=`echo $f | cut -c1-8`
	JAAR=`echo $DATUM | cut -c1-4`
	MAAND=`echo $DATUM | cut -c5-6`
	DAG=`echo $DATUM | cut -c7-8`
if [ -d /MEDIA/photos/$JAAR/$MAAND/$DAG/ ]
then
	IFS=
	mv -- "$f" /MEDIA/photos/$JAAR/$MAAND/$DAG/
else
	IFS=
	mkdir -p /MEDIA/photos/$JAAR/$MAAND/$DAG/
	mv -- "$f" /MEDIA/photos/$JAAR/$MAAND/$DAG/
fi

done 
