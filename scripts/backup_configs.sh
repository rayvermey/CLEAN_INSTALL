cd /home/ray
	tar czvf RAY_DOT_CONFIGS.bkup \
		.config/bspwm \
		.config/sxhkd \
		.config/polybar
echo "Copy file to the Cloud (Stack)"
cp RAY_DOT_CONFIGS.bkup /DATA_CLOUD/Cloud/Stack
echo Copy done!

