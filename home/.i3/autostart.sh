# Autostart script executed after i3 config is loaded.

# GNOME PolicyKit and Keyring
eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &

# Start Thunar Daemon, enables faster startup time for thunar.
thunar --daemon &

# Applets
pasystray & # Volume control
nm-applet & # Network manager
udiskie --no-automount --no-notify --tray &

# Set keyboard settings - 150ms delay and 30 cps (characters per second) repeat
# rate. Adjust the values according to your preferences.
xset r rate 150 30 &

# Turn off system beep
xset b off &

# Apply multi-monitor layout, ignore if it doesn't exist.
if [ -e ~/.screenlayout/layout.sh ]
then
    ~/.screenlayout/layout.sh &
fi

# Set the background, sleep a bit to make sure previous layout has been
# applied correctly.
(sleep 2; feh  --bg-fill '/home/jaapz/.wallpaper.png')
