{ config, pkgs, ... }:

{

  programs.starship.enable = true;

  programs.zsh = {
    enable = true;
  };


  home.file = {
    ".zshrc".source = ./dotfiles/.zshrc;
    ".config/starship.toml".source = ./dotfiles/starship.toml;
  };

}