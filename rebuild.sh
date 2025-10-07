#!/usr/bin/env bash
echo "rebuilding!!"
sudo nixos-rebuild switch --flake /home/farmslop/nixos/#desktop
find ~/nixos/dotfiles/ -type f -name "*.sh" -exec chmod +x {} \;
stow -R dotfiles
