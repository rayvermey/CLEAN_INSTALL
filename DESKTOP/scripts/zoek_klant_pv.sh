KLANT=`grep -i $1 ~/Downloads/klanten_pv.txt`
echo $KLANT
ID=`echo $KLANT|cut -d, -f1`
echo ID klant = $ID

ID=`echo $KLANT|cut -d, -f1`
echo ID klant = $ID

ACC_NAME=`echo $KLANT|cut -d, -f2`
echo  Account_Name = $ACC_NAME

EMAIL=`echo $KLANT|cut -d, -f3`
echo Email klant = $EMAIL

NAAM=`echo $KLANT|cut -d, -f4`
echo Naam klant = $NAAM

INSCHRIJF_DATE=`echo $KLANT|cut -d, -f6`
echo Inschrijf_Datum klant = $INSCHRIJF_DATE

LAATSTE_INLOG=`echo $KLANT|cut -d, -f7`
echo Laatste Inlog klant = $LAATSTE_INLOG

IPADRES=`echo $KLANT|cut -d, -f8`
echo IP adres klant = $IPADRES

TOTAAL_UPGRADED=`echo $KLANT|awk -F, '{print $11}'`
echo "Klant heeft opgewaardeerd voor  ${TOTAAL_UPGRADED}"

echo klant heeft `grep $IPADRES ~/Downloads/klanten_pv.txt|wc -l` accounts
