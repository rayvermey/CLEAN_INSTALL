cd /data/media/Muziek/New\ Age/00_New\ uit\ te\ zoeken/00_Vers
 find . -name "*.mp3" -print -exec mp3tag -g 010 {} \;
mv * ../
