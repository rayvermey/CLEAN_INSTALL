#!/usr/bin/env bash
IFS=$'\n\t'

seek=3

shutdown() {
 # Get our process group id
 pgroup=$(ps -o pgid= $$)

 # Kill it in a new new process group
 setsid kill -- -"${pgroup// /}"
 exit 0
}
trap "shutdown" SIGINT SIGTERM

while true; do
 # requires playerctl>=2.0
 playerctl --follow metadata --format \
  $'{{status}}\t{{artist}} - {{title}} {{duration(position)}}|{{duration(mpris:length)}}' |
 while read -r status line; do
  # escape [&<>] for pango formatting
  line="${line//&/&amp;}"
  line="${line//>/&gt;}"
  line="${line//</&lt;}"
  case $status in
   Paused) echo '<span foreground="#cccc00" size="smaller">'"$line"'</span>' ;;
   Playing) echo "<small>$line</small>" ;;
   *) echo '<span foreground="#073642">⏹</span>' ;;
  esac
 done
 # no current players
 echo '<span foreground=#dc322f>⏹</span>'
 sleep 15
done &

# requires i3blocks@6e8b51d or later
while read -r button; do
 # shellcheck disable=1091
 case "$button" in
  1) playerctl play-pause ;;
  3) . sys-notif media ;;
  4) playerctl position "$seek+" ;;
  5) playerctl position "$seek-" ;;
 esac
done

