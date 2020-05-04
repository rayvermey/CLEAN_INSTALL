#!/usr/bin/bash

SPOTIFY_STATUS=$(playerctl -p spotify status)
if [ $SPOTIFY_STATUS == "Paused" ]
then
	TRACKINFO=""
else
	TRACKINFO=$(playerctl -p spotify metadata --format '{{artist}} - {{title}}')
	#echo $TRACKINFO	
fi
MPC_STATUS=$(mpc | tail -2 | head -1 | cut -d" " -f1)
if [ $MPC_STATUS == '[paused]' ]
then
	MTRACKINFO=""
else
	MTRACKINFO=$(mpc current)
	#echo $MTRACKINFO
fi

for NCSPOT in $(playerctl -l | grep ncspot)
do
        NCSPOT_STATUS=$(playerctl -p $NCSPOT status)
        if [ $NCSPOT_STATUS = "Paused" ]  ||  [ $NCSPOT_STATUS == "Stopped" ]
        then
                :
        else
                NCTRACKINFO=$(playerctl -p $NCSPOT metadata --format '{{artist}}  {{title}}')
        fi
done

for CHROMIUM in $(playerctl -l | grep chromium)
do
	CHROMIUM_STATUS=$(playerctl -p $CHROMIUM status)
	if [ $CHROMIUM_STATUS = "Paused" ]  ||  [ $CHROMIUM_STATUS == "Stopped" ]
	then
		:
	else
		CTRACKINFO=$(playerctl -p $CHROMIUM metadata --format '{{artist}}  {{title}}')
	fi
done

#	echo "<span color='#02fa44'>" " $TRACKINFO </span>" "<span color='#fa0223'>"" $CTRACKINFO </span>" "<span color='#f0ca1a'>"" $MTRACKINFO </span>"

for CLEMENTINE in $(playerctl -l | grep clementine)
do
	CLEMENTINE_STATUS=$(playerctl -p $CLEMENTINE status)
	if [ $CLEMENTINE_STATUS = "Paused" ]  ||  [ $CLEMENTINE_STATUS == "Stopped" ]
	then
		:
	else
		CLTRACKINFO=$(playerctl -p $CLEMENTINE metadata --format '{{artist}}  {{title}}')
	fi
done

	echo "<span color='#02fa44'>" " $TRACKINFO </span>" "<span color='#fa0223'>"" $CTRACKINFO </span>" "<span color='#f0ca1a'>"" $MTRACKINFO </span>" "<span color='#FF5733'>"" $CLTRACKINFO </span>" "<span color='#FF5733'>"" $NCTRACKINFO </span>"
