{ config, pkgs, ... }:

{

  imports = [
              ./bar
  ];

  programs.hyprlock.enable = true;


}