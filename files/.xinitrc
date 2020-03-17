#!/bin/sh
#
# ~/.xinitrc
#

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Makes GTK follow ~/.Xcompose file
export GTK_IM_MODULE=xim

# Updates fonts adding local
#xset +fp /usr/share/fonts/local
#xset fp rehash

# Solid wallpaper
hsetroot -solid #000000

# XRANDR!
#xrandr --output LVDS-1 --off
xrandr --output LVDS-1 --preferred
xrandr --output VGA-1 --preferred --right-of LVDS-1
xrandr --output DP-1 --preferred
xrandr --output HDMI-1 --preferred

# Set keymap
setxkbmap br
# Config keys         130 50
xset r rate 130 100   
# Disable bell
xset -b
# Remap caps to escape
setxkbmap -option caps:escape
# Set Compose key to menu key
setxkbmap -option compose:menu

# Name the window manager because java needs it (solving arduino's window bug)
wmname LG3D
export _JAVA_AWT_WM_NONREPARENTING=1

# Set wallpaper
feh -no-fehbg --bg-fill ~/Pictures/Wallpapers/2.jpg

# Set compton
#compton -Cb &
#picom &

#pulseaudio --start
#cadence-session-start --system-start &

# Uniform adwaita Style
QT_STYLE_OVERRIDE=adwaita
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# Set statusbar
while ~/.dwmstatus; do
    sleep 1s
done &      

exec dwm

