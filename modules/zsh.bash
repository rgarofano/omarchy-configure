echo "Installing zsh"
sudo pacman -Sy --noconfirm zsh
echo "Done"

ZSH_PATH=$(command -v zsh)

echo "Changing default shell to $ZSH_PATH"
sudo chsh -s "$ZSH_PATH" "$USER"
echo "Done"

echo "Switching shell to $ZSH_PATH in alacritty config"
echo -e "\n[terminal]\n\n[terminal.shell]\nprogram = \"$ZSH_PATH\"" >>"$HOME/.config/alacritty/alacritty.toml"
echo "Done"

echo "Setting up zshrc"
mkdir -p "$HOME/.config"
git clone https://github.com/rgarofano/zshrc.git "$HOME/.config/zsh"
ln -s "$HOME/.config/zsh/.zshrc" "$HOME/.zshrc"
echo "Done"
