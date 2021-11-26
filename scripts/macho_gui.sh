manual=$(apropos -s ${SECTION:-''} ${@:-.} | \
    grep -v -E '^.+ \(0\)' |\
    awk '{print $2 "    " $1}' | \
    sort | \
    rofi -dmenu -i -p "Manual: " | \
    sed -E 's/^\((.+)\)/\1/')

[ -z "$MANUAL" ] && exit 0;

man -T${FORMAT:-pdf} $manual | ${READER:-zathura -}
