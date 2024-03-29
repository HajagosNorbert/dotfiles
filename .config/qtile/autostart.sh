#!/bin/sh


# hdmi monitor is left to the laptops display
xrandr --output HDMI2 --left-of eDP1

# when restarting qtile this will not run. So after plugging in a new monitor, this is not enaugh
#autorandr --change

# feh --bg-scale /usr/share/endeavouros/backgrounds/endeavouros-wallpaper.png
feh --bg-scale ~/Pictures/fox-wp.jpg

picom & disown # --experimental-backends --vsync should prevent screen tearing on most setups if needed

# Low battery notifier
#~/.config/qtile/scripts/check_battery.sh & disown

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown # start polkit agent from GNOME

nm-applet & disown

/usr/lib/geoclue-2.0/demos/agent & disown

redshift-gtk & disown
