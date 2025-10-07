{ config, pkgs, ... }:

{
  imports = [../../font.nix];

  programs.kitty.enable = true;
}