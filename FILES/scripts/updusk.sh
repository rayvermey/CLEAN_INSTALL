cd ~/git/dusk
NEW_COMMIT=$(git log | head -1 | cut -d" " -f2)
echo $NEW_COMMIT
LAST_COMMIT=$(cat LAST_COMMIT.txt | cut -d" " -f2)
echo $LAST_COMMIT

if [ ${NEW_COMMIT} != ${LAST_COMMIT} ]
then
	echo Hoera, een update van Dusk\!
	rsync --recursive . /home/ray/git/DUSK_BCK/DUSK.ORG && git pull && rsync --recursive . /home/ray/git/DUSK_BCK/DUSK.$(date "+%y%m%d_%H%M")
	git pull
	./build.sh
	echo $NEW_COMMIT > LAST_COMMIT.txt
	git log | head -10
else
	echo Geen veranderingen
fi
