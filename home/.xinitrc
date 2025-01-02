#!/usr/bin/env zsh

# Loading Scripts
PATH="$HOME/.config/bspwm/scripts:$PATH"

# Add Rule's to bspwm window
bspc config external_rules_command 		"$HOME"/.config/bspwm/scripts/bspexternalrules

# Display Setup 
DISPLAY=":0"  # Set the DISPLAY environment variable to your X session, e.g., :0
MONITER="DP1"

if ! xrandr --query | grep "1920x1080"; then
  xrandr --newmode "1920x1080" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync
  xrandr --addmode "$MONITER" "1920x1080"
fi

xrandr --output "$MONITER" --mode "1920x1080"


# Keybord (Shortcut) Setup
sxhkd -c "$HOME"/.config/bspwm/sxhkdrc &

# Setup Compositer
picom --config "$HOME"/.config/bspwm/picom.conf &

# Notification Setup
bspdunst

# Autolock
xss-lock -- betterlockscreen -l &

# Ibus daemon
ibus-daemon -drx &

# Polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Wallpaper Setup 
feh --bg-fill "$(< "${HOME}/.cache/wal/wal")"  

# Restoring colorscheme 
wal -R

# Starting bspwm
exec bspwm
