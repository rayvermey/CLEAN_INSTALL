#!/usr/bin/bash
  if [ `pgrep gimp` -gt 0 ]
  then
	 /usr/bin/gimp &
	  bspc desktop --focus ^9
  else
    bspc desktop --focus ^9
  fi
