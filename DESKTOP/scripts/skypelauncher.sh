#!/bin/sh
export XLIB_SKIP_ARGB_VISUALS=1
LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libv4l/v4l1compat.so skype
exit 0
