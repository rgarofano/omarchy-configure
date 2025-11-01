#!/usr/bin/env bash

cat <<EOF >> "$XDG_CONFIG_HOME/hypr/autostart.conf"
exec-once = hyprsunset
windowrulev2 = workspace 1 silent, class:^(chrome-web.whatsapp.com__-Default)$
exec-once = [workspace 1 silent] signal-desktop
exec-once = [workspace 2 silent] omarchy-launch-browser
exec-once = [workspace 3] omarchy-launch-terminal
exec-once = [workspace 4 silent] thunderbird
exec-once = [workspace 5 silent] spotify
EOF
