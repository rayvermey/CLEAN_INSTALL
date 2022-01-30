>/data/twitter/follow.back
>/data/twitter/follow.not

for USER in `cat /data/twitter/friends.all.srt`
do
  if grep $USER /data/twitter/followers.all.srt 
  then
      echo $USER >>/data/twitter/follow.back
  else
      echo $USER >>/data/twitter/follow.not
  fi
done
