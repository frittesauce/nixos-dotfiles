{ config, pkgs, ... }:

{

  imports = [../../terminals/kitty
              ./bar
  ];

  programs.hyprlock.enable = true;


  home.file = {
    ".config/hypr/hyprland.conf" = {
      source = ../../dotfiles/hypr/hyprland.conf;
    };
    ".config/hypr/scripts/startup.sh" = {
      source = ../../dotfiles/hypr/scripts/startup.sh;
      executable = true;
    };
    ".config/rofi/config.rasi" = {
      source = ../../dotfiles/rofi/config.rasi;
    };
  };
}