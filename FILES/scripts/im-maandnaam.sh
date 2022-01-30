for f in IMG_????????_*.jpg
do
	JAAR=`echo $f| cut -c5-8`
	NMAAND=`echo $f|cut -c9-10`
	case $NMAAND in	
		Jan)
			MAAND=01 ;;
		Feb)
			MAAND=02 ;;
		Mar)	
			MAAND=03 ;;
		Apr)
			MAAND=04 ;;
		May)
			MAAND=05 ;;
		Jun)
			MAAND=06 ;;
		Jul)
			MAAND=07 ;;
		Aug)
			MAAND=08 ;;
		Sep)
			MAAND=09 ;;
		Oct)
			MAAND=10 ;;
		Nov)
			MAAND=11 ;;
		Dec)
			MAAND=12 ;;
		*)	
			MAAND=$NMAAND ;;
	esac

	DAG=`echo $f | cut -c11-12`

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

