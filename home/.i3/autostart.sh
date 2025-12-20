# Autostart script executed after i3 config is loaded.

# GNOME PolicyKit and Keyring
eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &

# Start Thunar Daemon, enables faster startup time for thunar.
thunar --daemon &

# Applets
pasystray & # Volume control
nm-applet & # Network manager
udiskie --no-automount --no-notify --tray &
blueman-applet &

# background image
swaybg -i ~/.wallpaper.png --mode fill &

# notifications deamon
mako &
