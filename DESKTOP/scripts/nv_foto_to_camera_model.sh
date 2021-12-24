#!/usr/bin/bash
for YEAR in 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021
do
	for MONTH in 01 02 03 04 05 06 07 09 10 12 12
	do
		for DAY in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
		  do
			  if [ -d  $YEAR/$MONTH/$DAY ]
			  then
			  cd $YEAR/$MONTH/$DAY

				for f in *.jpg
				do
					CAMERA=`exiv2 "$f" | grep "Camera model" | cut -d" " -f7-8` >/dev/null 2>&1
					echo "$f" - $CAMERA
				
					if [ -z "$CAMERA" ]
					then
						echo NO EXIF DATA
					else	
						DEST_DIR="${CAMERA}"
						if [ -d "$DEST_DIR" ]
						then
							mv "$f" "${DEST_DIR}"
						else
							mkdir "${DEST_DIR}"
							mv "$f" "${DEST_DIR}"
						fi
					fi
				done

				for f in *.JPG
				do
					CAMERA=`exiv2 "$f" | grep "Camera model" | cut -d" " -f7-8` >/dev/null 2>&1
					echo "$f" - $CAMERA
				
					if [ -z "$CAMERA" ]
					then
						echo NO EXIF DATA
					else	
						DEST_DIR="${CAMERA}"
						if [ -d "$DEST_DIR" ]
						then
							mv "$f" "${DEST_DIR}"
						else
							mkdir "${DEST_DIR}"
							mv "$f" "${DEST_DIR}"
						fi
					fi
				done

			  cd ../../..
			  fi

		  done
	  done
done
