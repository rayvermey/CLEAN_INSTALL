#
# Zet eerst nieuwere files apart
#
find /var/www/mm -type f -newer /data/LastMMbackup | xargs tar cvf /data/MM_Modified
#
# Haal Moonminerals hier naar toe
#
# Eerst alles weg
cd /var/www/mm
rm -r *
echo Bestanden van Moonminerals ophalen
ncftpget -v -R -T -u web20104 -p DLEU18hYd ftp://www.moonminerals.nl/html
echo Bestanden van html copieren
cp -r html/* .
echo Config bestanden teruzgetten
cp  /home/ray/configs_mm/configure.php_shop includes/configure.php
cp  /home/ray/configs_mm/configure.php_admin admin/includes/configure.php 
cp  /home/ray/configs_mm/define_main_page_nl.php includes/languages/dutch/html_includes/classic/define_main_page.php
cp  /home/ray/configs_mm/define_main_page_en.php includes/languages/english/html_includes/classic/define_main_page.php
cp /home/ray/configs_mm/orders2009.php .
cp /home/ray/configs_mm/orders2010.php .
echo Database restoren
SQL_FILE=`ls -1 admin/backups/*.gz|tail -1`
cp $SQL_FILE backup.sql.gz
gunzip -f backup.sql.gz
sed 's/\/images\/pages/images\/pages/g' backup.sql >backup_modified.sql
mysql -pqazwsx12 moonminerals < backup_modified.sql

echo Oude html dir verwijderen
rm -r html
rm -r var
echo maken backup tar zip file
tar cvf backup_moomminerals_test.tar *
echo compressing backupfile
gzip  backup_moomminerals_test.tar
DATE=`date "+%d%m%Y"`
mv  backup_moomminerals_test.tar.gz /data/backup_moomminerals_test.tar.$DATE.gz
#
# Modified files terugzetten
cd /var/www/mm
tar xvf /data/MM_Modified
echo Permissies rechtzetten
chgrp manon -R /var/www/mm
chmod 775 -R /var/www/mm
touch /data/MM_Modified
echo Done!
