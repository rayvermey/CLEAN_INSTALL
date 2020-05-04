#!/usr/bin/bash
  if [ `pgrep gotop` -gt 0 ]
  then
	 xterm -T GoTop -e gotop &
	 wmctrl -r "GoTop" -t 0 
    	 bspc desktop --focus ^1
  else
    bspc desktop --focus ^1
  fi
