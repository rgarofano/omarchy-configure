echo "Installing zsh"
sudo pacman -Sy --noconfirm zsh
echo "Done"

ZSH_PATH=$(command -v zsh)

echo "Changing default shell to $ZSH_PATH"
sudo chsh -s "$ZSH_PATH" "$USER"
echo "Done"

echo "Switching shell to $ZSH_PATH in alacritty config"
echo -e "\n[terminal]\n\n[terminal.shell]\nprogram = \"$ZSH_PATH\"" >> "$XDG_CONFIG_HOME/alacritty/alacritty.toml"
echo "Done"

echo "Setting up zshrc"
mkdir -p "$XDG_CONFIG_HOME"
git clone https://github.com/rgarofano/zshrc.git "$XDG_CONFIG_HOME/zsh"
ln -s "$XDG_CONFIG_HOME/zsh/.zshrc" "$HOME/.zshrc"
echo "Done"
