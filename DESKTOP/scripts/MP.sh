for JAAR in 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020
do
for MAAND in 01 02 03 04 05 06 07 08 09 10 11 12
do
	for  DAG in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
	do
		if [ -d $JAAR/$MAAND/$DAG/$DAG/Day-$DAG ]
		then
			#ls -l $JAAR/$MAAND/$DAG/$DAG/Day-$DAG
			if [ ! -d /MEDIA/photos/$JAAR/$MAAND/$DAG ]
			then
				mkdir /MEDIA/photos/$JAAR/$MAAND/$DAG
			fi
			mv $JAAR/$MAAND/$DAG/$DAG/Day-$DAG/* /MEDIA/photos/$JAAR/$MAAND/$DAG
		fi
	done
done
done

