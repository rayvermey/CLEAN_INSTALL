cd /home/ray/.config
rsync --ignore-existing -azv --del picom.conf /DATA/cloud/Jotta/CLEAN_INSTALL/DESKTOP/.config/
rsync --ignore-existing -azv --del joplin-desktop /DATA/cloud/Jotta/CLEAN_INSTALL/DESKTOP/.config/
rsync --ignore-existing -azv --del /home/ray/Downloads/shared_configs/autokey /DATA/cloud/Jotta/CLEAN_INSTALL/DESKTOP/.config/
rsync --ignore-existing -azv --del i3 /DATA/cloud/Jotta/CLEAN_INSTALL/DESKTOP/.config/
rsync --ignore-existing -azv --del i3status /DATA/cloud/Jotta/CLEAN_INSTALL/DESKTOP/.config/
rsync --ignore-existing -azv --del termite /DATA/cloud/Jotta/CLEAN_INSTALL/DESKTOP/.config/
rsync --ignore-existing -azv --del Insync /DATA/cloud/Jotta/CLEAN_INSTALL/DESKTOP/.config/
rsync --ignore-existing -azv --del pcloud /DATA/cloud/Jotta/CLEAN_INSTALL/DESKTOP/.config/
rsync --ignore-existing -azv --del --exclude-from rsync_exclude.lst ramboxpro /DATA/cloud/Jotta/CLEAN_INSTALL/DESKTOP/.config/
