#curl "http://www.funda.nl/makelaars/leiden/" | grep "-" | grep MakelaarTelefoonLink| cut -c82-150|sed 's/\"//g'|sed 's/^/http:\/\/www.funda.nl/' >TELLIJST
while read MAKELAAR
do
	curl $MAKELAAR
done < TELLIJST >MAKELAARLIJST
grep -i "contact met de mak" MAKELAARLIJST >MAKDIRTY
