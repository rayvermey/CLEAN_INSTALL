if [ $(date "+%w") -lt 6 ]
then
	teams &
else
	:
fi
