bspc rule -a Termite -o desktop='^1' state=floating rectangle=920x1020+0+20 border_width=0 && termite -e gotop &
sleep 1
bspc rule -a Termite  desktop='^1' state=floating rectangle=800x548+930+20 border_width=0 && sudo termite -e "iftop -i wlp0s20f0u2" &
sleep 1
bspc config -d '^1' border_width 0
bspc rule -a Cairo-clock -o desktop='^1' state=floating rectangle=300x300+600+400 && cairo-clock -o -t zen -d &
sleep 1
#bspc rule -r "*"
