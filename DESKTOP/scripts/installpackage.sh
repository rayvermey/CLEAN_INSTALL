sudo pacman -S $1 2>/dev/null
if [ $? -eq 1 ]
then
	echo "Package via pacman niet gevonden - door naar yay" 
	yay -S $1
	  if [ $? -eq 1 ]
	  then
	    echo "Package $1 is ook niet in AUR"
	  fi
else

	:
fi
