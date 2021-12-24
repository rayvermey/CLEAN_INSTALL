#!/usr/bin/bash
  if [ `pgrep dolphin` -gt 0 ]
  then
	 /usr/bin/dolphin &
	  bspc desktop --focus ^2
  else
    bspc desktop --focus ^2
  fi
