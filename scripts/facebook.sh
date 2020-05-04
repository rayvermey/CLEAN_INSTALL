if ! pgrep -f ICE-SSB-facebook ;
        then
        firefox -new-instance --class ICE-SSB-facebook --profile /home/ray/.local/share/ice/firefox/facebook  http://www.facebook.com &
fi
