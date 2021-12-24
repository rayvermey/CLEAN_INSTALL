for TAG in `herbstclient tag_status`                                                                                                               ✔  4717  00:40:32
do
	if [ ${TAG:0:1} = . ]
	then
	  herbstclient merge_tag ${TAG:1:10}
	fi
done
