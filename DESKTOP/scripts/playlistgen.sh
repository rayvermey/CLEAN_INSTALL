#!/bin/bash
touch "${PWD##*/}.m3u"
export IFS=$'\n'
for i in $(find $1 -name "*.mp3" -type f)
do 
echo "$i" |sed 's/..\(.*\)/\1/' >> "${PWD##*/}.m3u"
done

shuf "${PWD##*/}.m3u" > "${PWD##*/}2.m3u"
shuf "${PWD##*/}2.m3u" > "${PWD##*/}.m3u"
rm "${PWD##*/}2.m3u"
