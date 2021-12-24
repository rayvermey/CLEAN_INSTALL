for USER in `cat /data/twitter/ecoach1/follow.not`
do
   if grep $USER /data/twitter/ecoach1/follow.keep
   then
       :
   else
      curl -u ecoach1:12qwaszx -d "" http://api.twitter.com/1/friendships/destroy/$USER.xml 
   echo Unfollowed $USER 
   fi
done
