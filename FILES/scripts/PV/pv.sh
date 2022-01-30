curl -L http://www.paravisie.nl > /home/ray/scripts/pv.tmp 2>/dev/null
sed 's/"user"/"user"\
        /g' /home/ray/scripts/pv.tmp > /home/ray/scripts/pv.tmp.o
if [ `grep ONLINE /home/ray/scripts/pv.tmp.o | wc -l` -gt 0 ]
then
  ONLINE=`grep ONLINE /home/ray/scripts/pv.tmp.o | wc -l`
  BELLERS=`grep ONLINE /home/ray/scripts/pv.tmp.o | grep '"enable_calls":true' | wc -l`
  CHATTERS=`grep ONLINE  /home/ray/scripts/pv.tmp.o | grep '"enable_chat":true'| wc -l`
#  BEIDEN=`grep ONLINE  /home/ray/scripts/pv.tmp.o | grep '"enable_calls":true,"enable_chat":true' | wc -l`
  BUSY=`grep BUSY /home/ray/scripts/pv.tmp.o | wc -l`
  OFFLINE=`grep OFFLINE /home/ray/scripts/pv.tmp.o | wc -l`
  echo `date` ","  $ONLINE Beschikbaar "," $BELLERS Bellers "," $CHATTERS Chatters "," $BUSY Bezet "," $OFFLINE Offline >> /home/ray/scripts/pv.log | tail /home/ray/scripts/pv.log 
grep ONLINE /home/ray/scripts/pv.tmp.o | cut -d: -f6 | sed 's/,.*$//g' | sed 's/"//g' | while read line ; do echo -n $line "," ;  done | sed 's/,$//' | sed 's/ //g'  > /home/ray/scripts/whosonline.log.tmp
 DATE=`date`
 LINE=`cat /home/ray/scripts/whosonline.log.tmp`
echo $DATE "," $LINE >> /home/ray/scripts/whosonline.log

else
  OFFLINE=`grep OFFLINE /home/ray/scripts/pv.tmp.o | wc -l`
  BUSY=`grep BUSY /home/ray/scripts/pv.tmp.o | wc -l`
  ONLINE=0
  BELLERS=0
  CHATTERS=0
#  BEIDEN=0
  echo `date` ","  $ONLINE Beschikbaar "," $BELLERS Bellers "," $CHATTERS Chatters "," $BUSY Bezet "," $OFFLINE Offline >> /home/ray/scripts/pv.log tail /home/ray/scripts/pv.log 
  echo `date` " " "Niemand online "  >> /home/ray/scripts/whosonline.log
fi
USERS_BUSY=`grep BUSY /home/ray/scripts/pv.tmp.o | cut -d: -f6 | sed 's/,.*$//'`
echo `date` $USERS_BUSY >> /home/ray/scripts/BUSY.log
