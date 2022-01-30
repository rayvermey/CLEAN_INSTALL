rm /data/twitter/ecoach1/friends.*
NR=1
NC=-1
while [ $NC -ne 0 ]
do
echo ronde $NR met cursor $NC
  curl -u ecoach1:12qwaszx http://api.twitter.com/1/statuses/friends/ecoach1.xml?cursor=$NC >/data/twitter/ecoach1/friends.$NR
  NC=`grep next_cursor /data/twitter/ecoach1/friends.$NR|sed 's/<next_cursor>//'|sed 's/<\/next_cursor>//'`
  NR=`expr $NR + 1`
done
grep -h \<screen_name /data/twitter/ecoach1/friends.* | sed 's/<screen_name>//' | sed 's/<\/screen_name>//'|sed 's/^  //'  >/data/twitter/ecoach1/friends.all
sort -u /data/twitter/ecoach1/friends.all -o /data/twitter/ecoach1/friends.all.srt
