{ config, pkgs, ... }:

{

  imports = [../../terminals/kitty];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true; # Xwayland can be disabled.
  };

}