{ config, pkgs, ... }:

{

  imports = [../../terminals/kitty];


  home.file = {
    ".config/hypr" = {
      source = ../../dotfiles/hypr;
      recursive = true;
    };
  };
}