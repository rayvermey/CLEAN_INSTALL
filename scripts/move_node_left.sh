   bspc node -d prev
   bspc desktop -f prev
   exit 0

CURDT=`bspc query -D -d --names`
#TOTDT=`bspc query -D|wc -l`
#NEXTDT=`expr $CURDT + 1`

#if [ $NEXTDT -lt $TOTDT ]
#then
case $CURDT in
	2)
		NEXTDT=1;;
	3)
		NEXTDT=2;;
	4)
		NEXTDT=3;;
	5)
		NEXTDT=4;;
	A)
		NEXTDT=5;;
	B)
		NEXTDT=A;;
	C)
		NEXTDT=B;;
	D)
		NEXTDT=C;;
	E)
		NEXTDT=D;;
	F)
		NEXTDT=E;;
	G)
		NEXTDT=F;;
	H)
		NEXTDT=G;;
	I)
		NEXTDT=H;;
	J)
		NEXTDT=I;;
	K)
		NEXTDT=J;;
	L)
		NEXTDT=K;;
esac
   bspc node -d $NEXTDT
   bspc desktop -f $NEXTDT
#fi
