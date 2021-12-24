#!/usr/bin/bash
  if [ `pgrep ncmpcpp` -gt 0 ]
  then
	 xterm -T ncmpcpp -e ncmpcpp &
	 wmctrl -r "ncmpcpp" -t 1 
    	 bspc desktop --focus ^2
  else
    bspc desktop --focus ^2
  fi
