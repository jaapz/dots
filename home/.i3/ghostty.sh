#!/bin/sh
# Ghostty on X11 renders text at the same pixel size on every monitor, so on
# the lower-density side screen (HDMI-A-0, ~92 dpi vs ~124 dpi on the main
# screen) it looks a third bigger. Start with a smaller font when that screen
# has focus. Windows keep their size when moved to the other screen.
output=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused).output')

if [ "$output" = "HDMI-A-0" ]; then
    exec ghostty --font-size=10.25 "$@"
fi
exec ghostty "$@"
