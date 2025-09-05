echo "Installing software to perform keyboard remap"
sudo pacman -S interception-tools interception-caps2esc
echo "Done"

echo "Moving remap file to /etc/interception/udevmon.d/"
sudo mkdir -p /etc/interception/udevmon.d
sudo cp caps2esc.yaml /etc/interception/udevmon.d/
echo "Done"

echo "Starting and enabling udevmon service"
sudo systemctl enable --now udevmon
echo "Done"

echo "Swap left ALT and SUPER"
sed -i 's/kb_options = compose:caps/kb_options = altwin:swap_lalt_lwin/g' "$HOME/.config/hypr/input.conf"
echo "Done"
