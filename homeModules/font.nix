{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    nerd-fonts.comic-shanns-mono
  ];
}