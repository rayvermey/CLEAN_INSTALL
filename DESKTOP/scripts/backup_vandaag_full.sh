cd /tmp
echo Backing up database vandaae11_jos1
mysqldump -h www.vandaaag.nu -u vandaae11_jos1 -p"PtqKTNzmdK&*9" vandaae11_jos1 >backup.db.vandaaag.nu
echo Backup database vandaae11_jos1 klaar
echo Sync site Vandaaag!
sitecopy -s Vandaaag
echo Reading Database
mysql  -u root -pqazwsx12 ray < backup.db.vandaaag.nu
echo Done! 
