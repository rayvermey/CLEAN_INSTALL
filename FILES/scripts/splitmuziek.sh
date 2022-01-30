#!/bin/bash
#Convert ".ape or .flac" to ".mp3 or .ogg", using 
# 
# TOOLS: mp3split, lame, ffmpeg, flac
#
# Licence: GPL
# by Liping  Zhang
#Copyright (C) 2011  Liping Zhang - San Francisco, USA
#
#IF YOU FIND A BUG OR HAVE A SUGGESTION COMMENTO OR SIMPLY WANT TO CONTACT ME PLEASE MAIL ME TO 
#zhanglpg_*@gmail.com  REMOVING THE "_*"
#This is done to prevent spamming 

#This script is intended to convert ape or flac + cue files to 
#ogg vorbis or mp3 or flac files, setting the tags to the correct value,
#obtained from the cue file.
#
#(original license header from the cueape function within this script)
#IF YOU FIND A BUG OR HAVE A SUGGESTION COMMENTO OR SIMPLY WANT TO CONTACT ME PLEASE MAIL ME TO 
#rafadev_*@gmail.com  REMOVING THE "_*"
#This is done to prevent spamming 

#Copyright (C) 2006  Rafael Ponieman - Buenos Aires, Argentina

#This program is free software; you can redistribute it and/or
#modify it under the terms of the GNU General Public License
#as published by the Free Software Foundation; either version 2
#of the License, or (at your option) any later version.

#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with this program; if not, write to the Free Software
#Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

# usage:  inputoption outputoption 
#
e() { echo -e "$@";tput sgr0; }
red="\033[31m"
green="\033[32m"
nt="\033[0m"

clear


ee() {
 codee=$1
 e "\033[0m"
 exit $codee
}




testinstall() 
{
 if(test -x `whereis -b $1|sed -e 's/[^*]*\:\ //'|sed -e 's/\ [^*]*//'`)
 then  
  e ${green}"$1: found"${nt}
  return 0
 else  
  e ${red}"$1: not found"${nt}
  e ${red}"exit..."${nt}
  return  1 
 fi
}

iflag=
oflag=
ival="all"
oval="mp3"
dflag=
while getopts 'i:o:d:' OPTION
do
  case $OPTION in
  i) iflag=1
  ival="$OPTARG"
  ;;
  o) oflag=1
  oval="$OPTARG"
  ;;
  d)    dflag=" -d $OPTARGS "
  ;;
  ?) printf ${green}"Usage: %s: [-i input_format] [-o output format] \n" $(basename $0) >&2
  printf ${green}"input format supported are: flac, ape or all (default) \n" $(basename $0) >&2
  printf ${green}"out format supported are: mp3 (default), ogg \n" $(basename $0) >&2
  ee 2
  ;;
  esac
done

if [ "$iflag" ]; then 
 case $ival in
 ape|flac|wav|all) 
 #all) 
  e ${green}"input format is $ival "${nt} 
  ;;
 ?) 
  e ${red}"invalid argument $ival for -i "${nt} 
  ee 1
  ;;
 esac 
fi

if [ "$ival" = "ape" ]; then 
 testinstall ffmpeg || ee 1 
fi
if [ "$ival" = "flac" ]; then 
 testinstall flac || ee 1 
fi


#testinstall cueape.sh || ee 1 

if [ "$oflag" ]; then 
 case $oval in
 mp3|ogg|flac) 
  e ${green}"output format is $oval "${nt}
  ;;
 ?) 
  e ${red}"invalid argument $oval for -o "${nt}
  ee 1
  ;;
 esac 
fi


if [ "$oval" = "mp3" ]; then 
 testinstall lame || ee 1 
 testinstall mp3splt || ee 1 
fi
if [ "$oval" = "ogg" ]; then 
 testinstall oggenc || ee 1 
 testinstall mp3splt || ee 1 
 of=" -o "
fi
if [ "$oval" = "flac" ]; then 
 testinstall flac || ee 1 
 of=" -f "
fi 
testinstall cuetag || ee 1 

of="$oval $dflag"

e ${green}"calling with $of"${nt}
#set -x
#WAV=/tmp/output.wav

#
#IFILE=$(echo *.[aA][pP][eE])
#CFILE=$(echo *.[cC][uU][eE])

convertfile() 
{
 #search for "converted"
 dirn="$(dirname "$1")" 
 ldirn="$(basename "$dirn")" 
 if [ "$ldirn" = "converted" ]; then 
  e ${green}"skip converted folder"${nt}
  return 1  
 fi
 e ${green}"continue conversion"${nt}
 bnm="$(basename "$1")"
 bnm="${bnm%.[aA][pP][eE]}"
 bnm="${bnm%.[fF][lL][aA][cC]}"
 
 ebnm="$(printf "%q" "$bnm")"
 found="0"
 find -type f -name "$ebnm.[cC][uU][eE]" | while read fn ; do 
  found="1"
  e ${green}" converting file $1 ($bnm) and $fn"${nt}
  cueape "$1" "$fn" $of 
  return 2 
 done
 if ! [ $? -eq 2 ]; then
  e ${red}"Could not find cue file for $1"${nt}
  return 1
 fi
 return 0
}

cueape() 
{


 #scripted by deX


 case "$1" in
 *.[aA][pP][eE] | *[fF][lL][aA][cC] | *.[wW][aA][vV] )
  if [ ! -f "$1" ] ; then
   e ${red}"Input file $1 doesn't exist"${nt}
   return 1
  fi
  if [ ! -f "$2" ]; then
   e ${red}"Cue input file $2 doesn't exist"${nt}
   return 1
  fi ;;
 * ) 
  e ${red}"Error: invalid input parameters"${nt}
  return ;;
 esac

 #Testing parameters
 case "$3" in
 flac|ogg|mp3)
  ;;
 *)
  e ${red}"Invalid parameters"${nt}
  
  e "Usage: cueape [input ape/wav/flac file] [input cue file] [parameters]\nParameters can be: -m for mp3 encoding or -o for ogg encoding or -f for flac encoding.\n"
  return 1
 esac




 #Saving the position so as to return afterwards 
 olddir="$(pwd)"

 #Going to target directory


 tmp="$(basename "$1")"
 tmp="${tmp##*.}"
 #bnm="$tmp"
 bnm="$(basename "$1")"
 bnm="${bnm%.[aA][pP][eE]}"
 bnm="${bnm%.[fF][lL][aA][cC]}"
 bnm="${bnm%.[wW][aA][vV]}"

 based="$(dirname "$1")"
 #cd "$(dirname "$1")"
 if [ "$4" = "-d" ] ; then
  bnm="$5" 
 fi 

 #Checking for the output folder. If it's not there I create it
 [ ! -d "$based/$bnm" ] && mkdir "$based/$bnm" 
 cp -f "$2" "$based/$bnm/" 

 convertd="$(dirname "$1")/converted"

 [ ! -d "$convertd" ] && mkdir "$convertd"  

 #Decompress
 echo -en "\nCueape 0.1\n\n"
 echo -en "\033[1;32mStarting conversion\n"

 #Checking filetype by extension and decompressing
 #tmp="$(basename "$1")"
 #tmp="${tmp##*.}"


 case "$tmp" in
 [fF][lL][aA][cC]) 
  e ${green}"Decompressing FLAC file\n\n"${nt}
  
  tm="$(basename "$1")"
  tm="${tm%.[fF][lL][aA][cC]}"
  if [ -e "$convertd/${tm}.wav" ]; then 
   e "$convertd/${tm}.wav already exists, skipping decompression"
  else 
   out="$(flac "-d" "$1" -o "/tmp/${tm}.$$.wav" )" 
   mv "/tmp/${tm}.$$.wav" "$convertd/${tm}.wav"
  fi
  ;;
 [aA][pP][eE])
  e ${green}"\033[1;32mDecompressing APE file\n\n"${nt}
  
  tm="$(basename "$1")"
  tm="${tm%.[aA][pP][eE]}"
  #out="$(mac "$1" "Output/${tm}.wav" "-d")" 
  if [ -e "$convertd/${tm}.wav" ]; then
   e ${green}"$convertd/${tm}.wav already exists, skipping decompression"
  else 
   out="$(ffmpeg -i "$1" "/tmp/${tm}.$$.wav")"  
   mv "/tmp/${tm}.$$.wav" "$convertd/${tm}.wav"
  fi
  ;;
 [wW][aA][vV])
  
  tm="$(basename "$1")"
  tm="${tm%.[wW][aA][vV]}"
  e ${green}"copying wav file to converted dir"${nt}
  cp "$1" "$convertd/${tm}.wav"
  #ln -s "$1" "$convertd/${tm}.wav"
  ;;
 *)
  echo "Error: line 99"
 esac

 #cd "$bnm"
 e ${green}"Decompression finished\n"${nt}
 e ${green}"Starting reencoding\n\n"${nt}

 mkdir "/tmp/cueape$$"
 e ${green}"temp dir /tmp/cueape$$"${nt}
 case "$3" in
 ogg)
  #Calling oggenc. Saving output for future checking
  
  if [ -e "$convertd/${tm}.ogg" ]; then
   e ${green}"$convertd/${tm}.ogg already exists, skip reencoding"${nt}
   cp "$convertd/${tm}.ogg" "/tmp/cueape$$/$tm.ogg"
  else
   out="$(oggenc -q 6 -o "/tmp/cueape$$/$tm.ogg" "$convertd/${tm}.wav")"
   mv "/tmp/cueape$$/$tm.ogg" "$convertd/${tm}.ogg"
   echo -en "\033[1;32m\nReencoding finished\n"
  fi
  e ${green}"Splitting\n\n"${nt}
  
  #out="$(mp3splt -c "$(basename "$2")" -o "$bnm/@n+-+@t" "$convertd/$tm.ogg")"
  cp "$2" "/tmp/cueape$$"
  cd "/tmp/cueape$$" 
  out="$(mp3splt -c "$(basename "$2")" -o "@n+-+@t" "$tm.ogg")"
  rm -f "/tmp/cueape$$/$tm.ogg"
  e ${green}"transferring tags...\n\n"${nt}
  cuetag "$(basename "$2")" *.ogg
  cd "$olddir"
  mv /tmp/cueape$$/*.ogg "$based/$bnm/"
 # rm -f "$tm.wav" 
  ;;
 mp3)
  #Calling lame. Saving output for future checking
  if [ -e "$convertd/${tm}.mp3" ]; then
   e ${green}"$convertd/${tm}.mp3 already exists, skip reencoding"${nt}
   cp "$convertd/${tm}.mp3" "/tmp/cueape$$/${tm}.mp3"
  else
   out="$(lame --preset standard "$convertd/$tm.wav" "/tmp/cueape$$/$tm.mp3")"
   cp "/tmp/cueape$$/$tm.mp3" "$convertd/$tm.mp3" 
   echo -en "\033[1;32m\nReencoding finished\n"
  fi
  e ${green}"Splitting\n\n"${nt}
  
  #Using framemode becaus this settings are for VBR
  #out="$(mp3splt -f -c "$(basename "$2")" -o "$bnm/@n+-+@t" "$convertd/$tm.mp3")"
  #out="$(mp3splt -f -c "$2" -o "$based/$bnm/@n+-+@t" "$convertd/$tm.mp3")"
 # rm -f "$tm.wav" 
  cp "$2" "/tmp/cueape$$/"
  cd "/tmp/cueape$$"
  
  out="$(mp3splt -f -c "$(basename "$2")" -o "@n+-+@t" "$tm.mp3")"
  rm -f "/tmp/cueape$$/$tm.mp3"
  e ${green}"transferring tags...\n\n"${nt}
  cuetag "$(basename "$2")" *.mp3
  cd "$olddir" 
  mv /tmp/cueape$$/*.mp3 "$based/$bnm/"
  ;;
 flac)
  e ${green}"Splitting\n\n"${nt}
  cp "$2" "/tmp/cueape$$/"
  cp "$convertd/$tm.wav"  "/tmp/cueape$$/"
  cd "/tmp/cueape$$"
  #out="$(shnsplit -f "$(basename "$2")" -o 'flac flac -s -o "%f" -' -t "%n-%t" "$tm.wav")"
  out="$(shnsplit -f "$(basename "$2")" -o flac -t "%n-%t" "$tm.wav")"
  e ${green}"transferring tags...\n\n"${nt}
  cuetag "$(basename "$2")" *.flac
  cd "$olddir" 
  rm -f "/tmp/cueape$$/$tm.wav"
  mv /tmp/cueape$$/*.flac "$based/$bnm/"
  ;;
 *)
  e ${red}"unrecognized output format"${nt}
  return 1
  ;;
 esac
 
 cd "$oldir"
 e  ${green}"Processing finished successfully\n"${nt}

 return 0
}


if [ "$ival" = "ape" ] || [ "$ival" = "all" ]; then
 find -type f -name "*.[aA][pP][eE]" | while read file ; do
  convertfile "$file" 
 done
fi 

if [ "$ival" = "flac" ] || [ "$ival" = "all" ]; then
 find -type f -name "*.[fF][lL][aA][cC]" | while read file ; do
  convertfile "$file" 
 done
fi 

if [ "$ival" = "wav" ] || [ "$ival" = "all" ]; then
 find -type f -name "*.[wW][aA][vV]" | while read file ; do
  convertfile "$file" 
 done
fi 

e ${green}"conversion completed "${nt} 
ee 0

