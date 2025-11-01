#!/usr/bin/env bash

programs_to_remove=(1password-beta 1password-cli gnome-calculator libreoffice-fresh obsidian xournalpp blueberry pinta typora)
echo "sudo pacman -Rns --noconfirm ${programs_to_remove[@]}"
sudo pacman -Rns --noconfirm "${programs_to_remove[@]}"

webapps_to_remove=(HEY Basecamp "Google Photos" "Google Contacts" "Google Messages" Figma Zoom)
for webapp in "${webapps_to_remove[@]}"; do
    echo "Removing $webapp.."
    omarchy-webapp-remove "$webapp" >/dev/null 2>&1
    echo "Done"
done
