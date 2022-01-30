sed -i 's/\[.*\] //' ~/.todo

LINES=`wc -l ~/.todo|cut -d" " -f1`
TELLER="1"

while read LINE
do
	echo [$TELLER] $LINE
	TELLER=$[$TELLER+1]

done < ~/.todo > ~/.todo.new
mv  ~/.todo.new  ~/.todo
cat ~/.todo
