for USER in `cat /data/twitter/follow.not`
do
   if grep $USER /data/twitter/follow.keep
   then
       :
   else
      curl -u ecoach1:12qwaszx -d "" http://api.twitter.com/1/friendships/destroy/$USER.xml 
   echo Unfollowed $USER 
   fi
done
