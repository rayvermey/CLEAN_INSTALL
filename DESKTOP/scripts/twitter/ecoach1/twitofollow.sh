#!/bin/bash
WEEKNR=`date "+%W"`
DAG=`date "+%u"`
for INTEREST in nlp mindmap vacature banen detachering fieldmanager freeware gezocht directeur selfimprove self-improve succes vennep photo
do
/usr/bin/wget -O /data/twitter/ecoach1/twittersearchresult.$INTEREST http://search.twitter.com/search?q=$INTEREST 2>/dev/null
NAMES=`/bin/cat /data/twitter/ecoach1/twittersearchresult.$INTEREST`
for value in $NAMES
do
    if [[ $value =~ \?status\=@([^\"]*)\" ]]
    then
        TUID=`echo $value|cut -d= -f5|sed 's/\"//'`
        i=1
        n=${#BASH_REMATCH[*]}
        while [[ $i -lt $n ]]
        do
        if [ `grep $TUID /data/twitter/ecoach1/friends.all.srt` ]
        then
          :
          let i++
        else
        echo $TUID >>/tmp/twitfollows.$INTEREST
            /usr/bin/curl --basic --user ecoach1:12qwaszx --data status="follow $TUID" http://twitter.com/statuses/update.xml 2>/dev/null
            let i++
        fi
        shift
        done
    fi
done
mail -s"Auto followed on Twitter" ray@moonyar.nl < /tmp/twitfollows.$INTEREST
if [ ! -d /data/twitter/ecoach1/$WEEKNR ]
then
   mkdir /data/twitter/ecoach1/$WEEKNR
fi

if [ ! -d /data/twitter/ecoach1/$WEEKNR/$DAG ]
then
   mkdir /data/twitter/ecoach1/$WEEKNR/$DAG
fi
cat /tmp/twitfollows.$INTEREST >> /data/twitter/ecoach1/$WEEKNR/$DAG/twitfollows.$INTEREST
rm /tmp/twitfollows.$INTEREST
done
