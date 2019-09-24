# Autostart script executed after i3 config is loaded. Largely stolen from the
# default crunchbang openbox autostart script located in
# ~/.config/openbox/autostart.

## GNOME PolicyKit and Keyring
eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &

## Start Thunar Daemon
thunar --daemon &

## Start xscreensaver
xautolock -time 10 -locker 'slock' &

## Set keyboard settings - 250 ms delay and 25 cps (characters per second) repeat rate.
## Adjust the values according to your preferances.
xset r rate 250 25 &

## Turn on/off system beep
xset b off &

# Start dunst notification daemon
dunst &

## Set the background
feh  --bg-fill '/home/jaapz/.wallpaper.png'
