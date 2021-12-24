#!/usr/bin/bash
  if [ `pgrep vivaldi-snapshot` -gt 0 ]
  then
	 /usr/bin/vivaldi-snapshot &
	  bspc desktop --focus ^11
  else
    bspc desktop --focus ^11
  fi
