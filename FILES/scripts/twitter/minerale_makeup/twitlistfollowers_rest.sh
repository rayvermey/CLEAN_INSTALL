NR=24
NC=1302638677197044850
while [ $NC != 0 ]
do
echo ronde $NR met cursor $NC
  curl -u ecoach1:12qwaszx http://api.twitter.com/1/statuses/followers/ecoach1.xml?cursor=$NC >/data/twitter/followers.$NR
  NC=`grep next_cursor /data/twitter/followers.$NR|sed 's/<next_cursor>//'|sed 's/<\/next_cursor>//'`
  NR=`expr $NR + 1`
done
grep -h \<screen_name /data/twitter/followers.* | sed 's/<screen_name>//' | sed 's/<\/screen_name>//'|sed 's/^  //'  >/data/twitter/followers.all
sort -u /data/twitter/followers.all -o /data/twitter/followers.all.srt
