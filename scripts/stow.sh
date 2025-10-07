#!/bin/bash
find ~/nixos/dotfiles/scripts/ -type f -name "*.sh" -exec chmod +x {} \;
stow -R dotfiles
