{ config, pkgs, ... }:

{
  programs.yazi.enable = true;


  home.file = {
    ".config/yazi/yazi.toml".source = ../dotfiles/yazi/yazi.toml;
  };
}