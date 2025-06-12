{ config, pkgs, ... }:

{

  imports = [../../font.nix];

  programs.kitty.enable = true;

  home.file = {
    ".config/kitty" = {
      source = ../../dotfiles/kitty;
      recursive = true;
    };
  };

}