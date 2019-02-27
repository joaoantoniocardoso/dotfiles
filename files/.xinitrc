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

# Set URxvt
#[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Makes GTK follow ~/.Xcompose file
export GTK_IM_MODULE=xim

# Updates fonts adding local
#xset +fp /usr/share/fonts/local
#xset fp rehash

# Solid wallpaper
hsetroot -solid #000000

# XRANDR!
#xrandr --output LVDS1 --off
xrandr --output LVDS1 --preferred
xrandr --output VGA1 --preferred --right-of LVDS1
xrandr --output DP1 --preferred
xrandr --output HDMI1 --preferred

# Set compton
#compton -Cb &

# Set keymap
setxkbmap br
# Config keys
xset r rate 130 50
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

#pulseaudio --start
cadence-session-start --system-start &

# Set statusbar
while ~/.dwmstatus; do
    sleep 1s
done &      

exec dwm
#exec sway

