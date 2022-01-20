export LC_CTYPE="en_US.UTF-8"
xset -b
xbanish &
xinput set-prop /dev/wsmouse "Device Accel Constant Deceleration" 0.46000
setxkbmap -option ctrl:nocaps
xbattbar &
sctd &
pkill xidle
xidle -delay 5 -se -program "/usr/X11R6/bin/xlock -mode blank" -timeout 360 &

dwm
