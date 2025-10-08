#!/usr/bin/env bash
echo "rebuilding!!"

CURRENT_THEME=$(cat ~/nixos/current_theme)

echo "theme $CURRENT_THEME is selected"

sudo nixos-rebuild switch --flake /home/$HOSTNM/nixos/#$HOSTNM
find ~/nixos/dotfiles/ -type f -name "*.sh" -exec chmod +x {} \;

stow -R dotfiles
switch_theme.sh "$CURRENT_THEME"