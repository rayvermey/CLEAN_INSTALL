for SYSTEM in Nova_ArcoD Nova_Arch Nova_ArcoBP Nova_ArcoXM
do
echo Updating $SYSTEM
echo
echo Pacman
ssh $SYSTEM "sudo pacman -Syu --noconfirm"
echo
echo YAY
ssh $SYSTEM "yay -Syu"
echo Done!
done
