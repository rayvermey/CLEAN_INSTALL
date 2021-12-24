  cd /home/ray/HUUB
  rm -f *.txt
  rm -f *.file
  echo Processing
  curl http://www.supermagnete.de/dut/magnets.php?group=discs_small > alles.html 2>/dev/null
  grep "option value" alles.html | grep :|sed 's/^.*\"//'|sed 's/:.*$//'|grep \-|grep -v SALE|sed 's/>//' >alles.artnum
  for art in `cat alles.artnum`
  do
	curl http://www.supermagnete.de/dut/$art >$art.file 2>/dev/null
  done

  for best in `ls -1 *.file`
  do
        artid=`echo $best|sed 's/.file//'`
	html2text -ascii $best | sed '1,/Max. gebruikstemperatuur/d'| sed '/incl. /,$d'  | sed 's/      */vanaf /' | grep vanaf | sed 's/  */;/g' |cut -d";" -f2,4 |sed 's/^/'$artid';/' > $best.txt
  done
  DAYNUM=`date "+%j"`
  cat *.txt >alles.$DAYNUM
  DAYBEFORE=`expr $DAYNUM - 1`
  if [ `diff alles.$DAYNUM alles.$DAYBEFORE | wc -l` -gt 0 ]
  then
	diff alles.$DAYNUM alles.$DAYBEFORE | mail ray@moonyar.nl
  else
	:
  fi
  rm -f *.txt
  rm -f *.file
