#
# Eerst alles weg
cd /var/www/mm_temp
rm -rf *
echo Bestanden van Moonminerals ophalen
ncftpget -v -R -T -u web20104 -p DLEU18hYd ftp://www.moonminerals.nl/html
echo Bestanden van html copieren
cp -r html/* .
echo Oude html dir verwijderen
rm -r html
tar cvf backup_moonminerals_test.tar *
echo compressing backupfile
gzip  backup_moonminerals_test.tar
DATE=`date "+%d%m%Y"`
mv  backup_moonminerals_test.tar.gz /data/backup_moonminerals_test.tar.$DATE.gz
#
echo Done!
