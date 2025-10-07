{ config, pkgs, ... }:

{

  imports = [../../terminals/kitty
              ./bar
  ];

  programs.hyprlock.enable = true;


}