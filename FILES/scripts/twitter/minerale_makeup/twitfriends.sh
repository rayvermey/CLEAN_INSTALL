rm /data/twitter/friends.*
NR=1
NC=-1
while [ $NC -ne 0 ]
do
echo ronde $NR met cursor $NC
  curl -u ecoach1:12qwaszx http://api.twitter.com/1/statuses/friends/ecoach1.xml?cursor=$NC >/data/twitter/friends.$NR
  NC=`grep next_cursor /data/twitter/friends.$NR|sed 's/<next_cursor>//'|sed 's/<\/next_cursor>//'`
  NR=`expr $NR + 1`
done
grep -h \<screen_name /data/twitter/friends.* | sed 's/<screen_name>//' | sed 's/<\/screen_name>//'|sed 's/^  //'  >/data/twitter/friends.all
sort -u /data/twitter/friends.all -o /data/twitter/friends.all.srt
