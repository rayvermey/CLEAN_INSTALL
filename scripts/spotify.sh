#!/usr/bin/bash
  if [ `pgrep spotify` -gt 0 ]
  then
	 /usr/bin/spotify &
	  bspc desktop --focus ^10
  else
    bspc desktop --focus ^10
  fi
