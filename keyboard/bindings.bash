echo "Adding custom bindings to hyprland config"

echo '
# Opening Applications
unbind = SUPER SHIFT, A
bindd = SUPER, A, Activity, exec, $terminal -e btop
unbind = SUPER SHIFT, C
bindd = SUPER SHIFT, C, ChatGPT, exec, omarchy-launch-webapp "https://chatgpt.com"

# Tiling
bindd = SUPER, H, Move focus left, movefocus, l
unbind = SUPER, J
bindd = SUPER, J, Move focus down, movefocus, d
unbind = SUPER, K
bindd = SUPER, K, Move focus up, movefocus, u
bindd = SUPER, L, Move focus right, movefocus, r
bindd = SUPER SHIFT, H, Expand window left, resizeactive, -100 0
bindd = SUPER SHIFT, L, Expand window right, resizeactive, 100 0
bindd = SUPER SHIFT, K, Shrink window up, resizeactive, 0 -100
bindd = SUPER SHIFT, J, Expand window down, resizeactive, 0 100
bindd = SUPER CTRL, J, Toggle split, togglesplit, # dwindle

# Menus
unbind = SUPER ALT, SPACE
bindd = ALT, SPACE, Omarchy menu, exec, omarchy-menu
bindd = SUPER SHIFT, slash, Show key bindings, exec, omarchy-menu-keybindings

# Switch theme
unbind = SUPER SHIFT CTRL, SPACE
unbind = SUPER SHIFT, T
bindd = SUPER SHIFT, T, Pick new theme, exec, omarchy-menu theme
' >> "$XDG_CONFIG_HOME/hypr/bindings.conf"

echo "Done"
