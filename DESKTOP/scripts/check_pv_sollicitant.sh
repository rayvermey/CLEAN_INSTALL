for SOL in `cat ~/Downloads/Sollicitanten_pv.txt`
do
	if grep $SOL ~/Downloads/Experts_pv.txt >/dev/null
	then
		:
	else
		echo $SOL >>/tmp/mail
	fi
done

