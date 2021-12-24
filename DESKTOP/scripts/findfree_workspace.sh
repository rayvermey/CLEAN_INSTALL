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
			break
		fi
	fi
	done
