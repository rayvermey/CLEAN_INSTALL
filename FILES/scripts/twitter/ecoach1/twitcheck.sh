>/data/twitter/ecoach1/follow.back
>/data/twitter/ecoach1/follow.not

for USER in `cat /data/twitter/ecoach1/friends.all.srt`
do
  if grep $USER /data/twitter/ecoach1/followers.all.srt 
  then
      echo $USER >>/data/twitter/ecoach1/follow.back
  else
      echo $USER >>/data/twitter/ecoach1/follow.not
  fi
done
