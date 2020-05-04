STATUS=$(acpi -V | head -1)
CHARGING=$(echo $STATUS | cut -d" " -f3|sed 's/,//g')
#echo $CHARGING
PERCENT=$(echo $STATUS | cut -d" " -f4|sed 's/%,//g')
#echo $PERCENT
TIME=$(echo $STATUS | cut -d" " -f5)
#echo $TIME

if [ $CHARGING == "Discharging" ]
then
	if [ $PERCENT -ge 80 ]
	then
		BAT=""
		COLOR="green"
	elif [ $PERCENT -ge 50 ]
	then
		COLOR="yellow"
		BAT="  "
	elif [ $PERCENT -ge 30 ]
	then
		COLOR=orange
		BAT="  "
	else
		COLOR=red
		BAT="  "
	fi
	echo  "<span color=\"${COLOR}\">$BAT</span>""[$TIME]"
fi
if [ $CHARGING == "Charging" ]
then
	if [ $PERCENT -ge 80 ]
	then
		BAT=" "
		COLOR="green"
	elif [ $PERCENT -ge 50 ]
	then
		COLOR="yellow"
		BAT=" "
	elif [ $PERCENT -ge 30 ]
	then
		COLOR=orange
		BAT=" "
	else
		COLOR=red
		BAT=" "
	fi
	echo  "<span color=\"${COLOR}\">$BAT</span>""[$TIME]" " Tot Vol"
fi
