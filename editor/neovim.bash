echo "Setting up neovim config"

CLONE_DIR="$HOME/nvim/"
git clone https://github.com/rgarofano/nvim-config.git "$CLONE_DIR"

echo "Clearing current config"

rm -rf "$XDG_HOME_CONFIG/nvim"

if [ -d "$HOME/.local/share/nvim" ]; then
    rm -rf "$HOME/.local/share/nvim"
fi

if [ -d "$HOME/.local/state/nvim" ]; then
    rm -rf "$HOME/.local/state/nvim"
fi

echo "Done"

echo "Installing new config"
mv "$CLONE_DIR" "$XDG_HOME_CONFIG"
echo "Done"

echo "Done setting up neovim config"
