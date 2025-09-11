{ config, pkgs, ... }:

{

  imports = [../../terminals/kitty];

  programs.hyprlock.enable = true;


  home.file = {
    ".config/hypr/hyprland.conf" = {
      source = ../../dotfiles/hypr/hyprland.conf;
    };
    ".config/hypr/scripts/startup.sh" = {
      source = ../../dotfiles/hypr/scripts/startup.sh;
      executable = true;
    };
  };
}