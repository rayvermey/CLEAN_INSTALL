for f in *
 do
 nf=`echo $f | sed 's/[0-9][0-9][0-9][0-9]\ \-\ //'`
 mv "$f" "$nf"
 done
