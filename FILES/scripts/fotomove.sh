for f in *
do
	nf=`echo $f | sed 's/ /_/g'`
	if [ ! -f $nf ]
	then	
		mv "$f" $nf
	fi
done
