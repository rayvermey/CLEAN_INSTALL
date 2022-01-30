rm -f /data/twitter/ecoach1/followers.*
NR=1
NC=-1
while [ $NC != 0 ]
do
echo ronde $NR met cursor $NC
  curl -u ecoach1:12qwaszx http://api.twitter.com/1/statuses/followers/ecoach1.xml?cursor=$NC >/data/twitter/ecoach1/followers.$NR
  NC=`grep next_cursor /data/twitter/ecoach1/followers.$NR|sed 's/<next_cursor>//'|sed 's/<\/next_cursor>//'`
  NR=`expr $NR + 1`
done
grep -h \<screen_name /data/twitter/ecoach1/followers.* | sed 's/<screen_name>//' | sed 's/<\/screen_name>//'|sed 's/^  //'  >/data/twitter/ecoach1/followers.all
sort -u /data/twitter/ecoach1/followers.all -o /data/twitter/ecoach1/followers.all.srt
