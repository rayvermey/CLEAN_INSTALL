   bspc node -d next
   bspc desktop -f next
   exit 0
CURDT=`bspc query -D -d --names`
#TOTDT=`bspc query -D|wc -l`
#NEXTDT=`expr $CURDT + 1`

#if [ $NEXTDT -lt $TOTDT ]
#then
case $CURDT in
	1)
		NEXTDT=2;;
	2)
		NEXTDT=3;;
	3)
		NEXTDT=4;;
	4)
		NEXTDT=5;;
	5)
		NEXTDT=A;;
	A)
		NEXTDT=B;;
	B)
		NEXTDT=C;;
	C)
		NEXTDT=D;;
	D)
		NEXTDT=E;;
	E)
		NEXTDT=F;;
	F)
		NEXTDT=G;;
	G)
		NEXTDT=H;;
	H)
		NEXTDT=I;;
	I)
		NEXTDT=J;;
	J)
		NEXTDT=K;;
	K)
		NEXTDT=L;;
esac
   bspc node -d $NEXTDT
   bspc desktop -f $NEXTDT
#fi
