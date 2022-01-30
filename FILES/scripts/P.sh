for F in P*.JPG
do
   if [ `file $F | cut -d"," -f12 | grep -c datetime` = 1 ]
   then
	   file $F | cut -d" " -f19
   fi
   done



