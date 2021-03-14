export LC_CTYPE="en_US.UTF-8"
exec xset -b &
exec xbanish &
exec xinput set-prop /dev/wsmouse "Device Accel Constant Deceleration" 0.46000 &
exec setxkbmap -option ctrl:nocaps &
exec xbattbar &
exec sctd &

spectrwm
