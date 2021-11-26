	for i in {1..20}
	do
	WORKSPACES=$(i3-msg -t get_workspaces | jq -r .\[].name | sed 's/:.*$//' | sort -n)
	if   echo $WORKSPACES | grep $i  > /dev/null
	then
		:
	else
		if [ $i -lt 21 ]
		then
			i3-msg workspace ${i}:
			libreoffice /home/ray/Desktop/NEWmeterstanden.xlsx &
			firefox https://monitoring.solaredge.com/solaredge-web/p/site/710271/#/dashboard &
			break
		fi
	fi
	done
