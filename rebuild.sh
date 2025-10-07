#!/usr/bin/env bash
echo "rebuilding!!"

CURRENT_THEME=$(cat ~/.config/themeses/current_theme)

echo "theme $CURRENT_THEME is selected"

sudo nixos-rebuild switch --flake /home/farmslop/nixos/#desktop
find ~/nixos/dotfiles/ -type f -name "*.sh" -exec chmod +x {} \;
stow -R dotfiles
