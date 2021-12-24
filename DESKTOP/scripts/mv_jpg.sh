while read f
do
	DATUM=`echo $f | cut -d" " -f2`
	JAAR=`echo $DATUM | cut -d: -f1`
	MAAND=`echo $DATUM | cut -d: -f2`
	DAG=`echo $DATUM | cut -d: -f3|cut -c1-2`
if [ -d /MEDIA/photos/$JAAR/$MAAND/$DAG/ ]
then
	mv $f /MEDIA/photos/$JAAR/$MAAND/$DAG/
else
	mkdir -p /MEDIA/photos/$JAAR/$MAAND/$DAG/
	mv $f /MEDIA/photos/$JAAR/$MAAND/$DAG/
fi

done < DSC
