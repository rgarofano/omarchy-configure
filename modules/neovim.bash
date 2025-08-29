echo "Setting up neovim config"

CLONE_DIR="$HOME/nvim/"
git clone https://github.com/rgarofano/nvim-config.git "$CLONE_DIR"

echo "Clearing current config"

rm -rf "$HOME/.config/nvim"

if [ -d "$HOME/.local/share/nvim" ]; then
    rm -rf "$HOME/.local/share/nvim"
fi

if [ -d "$HOME/.local/state/nvim" ]; then
    rm -rf "$HOME/.local/state/nvim"
fi

echo "Done"

echo "Installing new config"
mv "$CLONE_DIR" "$HOME/.config"
echo "Done"

echo "Installing omarchy theme"
if [ -f "$HOME/.config/nvim/lua/plugins/theme.lua" ]; then
    # Use omarchy theme plugin instead
    rm "$HOME/.config/nvim/lua/plugins/theme.lua"    
fi
ln -s "$HOME/.config/omarchy/current/theme/neovim.lua" "$HOME/.config/nvim/lua/plugins/theme.lua"
echo "Done"

echo "Done setting up neovim config"
