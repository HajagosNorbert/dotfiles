#!/bin/sh

# hdmi monitor is left to the laptops display
xrandr --output HDMI2 --left-of eDP1

# when restarting qtile this will not run. So after plugging in a new monitor, this is not enaugh
#autorandr --change

feh --bg-scale ~/Pictures/fox-wp.jpg

nm-applet & disown

redshift-gtk & disown
