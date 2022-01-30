#!/bin/bash
WEEKNR=`date "+%W"`
DAG=`date "+%u"`
for INTEREST in make-up makeup make_up mineral-makeup skincare beautygloss mineral lipgloss foundation brushes
do
/usr/bin/wget -O /data/twitter/minerale_makeup/twittersearchresult.$INTEREST http://search.twitter.com/search?q=$INTEREST
NAMES=`/bin/cat /data/twitter/minerale_makeup/twittersearchresult.$INTEREST`
for value in $NAMES
do
    if [[ $value =~ \?status\=@([^\"]*)\" ]]
    then
	TUID=`echo $value|cut -d= -f5|sed 's/\"//'`
        i=1
        n=${#BASH_REMATCH[*]}
        while [[ $i -lt $n ]]
        do
        echo $TUID >>/tmp/twitfollows.$INTEREST
            /usr/bin/curl --basic --user minerale_makeup:qazwsx12 --data status="follow $TUID" http://twitter.com/statuses/update.xml
            let i++
        done
        shift
    fi
done
mail -s"Auto followed on Twitter Minerale_makeup" ray@moonyar.nl < /tmp/twitfollows.$INTEREST
if [ ! -d /data/twitter/minerale_makeup/$WEEKNR ]
then
   mkdir /data/twitter/minerale_makeup/$WEEKNR
fi

if [ ! -d /data/twitter/minerale_makeup/$WEEKNR/$DAG ]
then
   mkdir /data/twitter/minerale_makeup/$WEEKNR/$DAG
fi
cat /tmp/twitfollows.$INTEREST >> /data/twitter/minerale_makeup/$WEEKNR/$DAG/twitfollows.$INTEREST
rm /tmp/twitfollows.$INTEREST
done
