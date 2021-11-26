#RED='#fc4138'
##GREEN='#52E067'
#DARKBACK='#3E485A'
#LIGHTBACK='#5B6579'

while :
do
DATE=$(date "+%H:%M - %d-%m")

WEER=$(/home/ray/scripts/weer.sh Nieuw-Vennep)

DISK=$(df -h 2>/dev/null|grep /home | grep -vi pcloud | cut -d" " -f12)

MEMFREE=$( free -g| grep Mem: | cut -c40-44)
SWAPFREE=$(free -g| grep Swap: | cut -c42-44 )
CPU=$(w|head -1 | cut -c46-62)
KERNEL=$(uname -r)
PACKAGES=$(pacman -Qq|wc -l)
TOUPGRADE=$(pacman -Qu|wc -l)

	OUT_BYTES_OLD=$(cat /sys/class/net/br0/statistics/tx_bytes)
	sleep 1
	OUT_BYTES_NEW=$(cat /sys/class/net/br0/statistics/tx_bytes)
	OUT_BYTES_NOW=$(( ($OUT_BYTES_NEW - $OUT_BYTES_OLD ) / 1024 ))  

	IN_BYTES_OLD=$(cat /sys/class/net/br0/statistics/rx_bytes)
	sleep 1
	IN_BYTES_NEW=$(cat /sys/class/net/br0/statistics/rx_bytes)
	IN_BYTES_NOW=$(( ($IN_BYTES_NEW - $IN_BYTES_OLD) / 1024 )) 

duskc run_command setstatus 9 "🎅 ${KERNEL}| 🗃️  ${PACKAGES} U: $TOUPGRADE✹ 📅| ${DATE}|$WEER ☝| ${DISK}| 💈 MEM FREE $MEMFREE |  SWP FREE $SWAPFREE|🙏 $CPU |🧘 TX: IN $IN_BYTES_NOW  |TX: OUT $OUT_BYTES_NOW"

sleep 5
done
