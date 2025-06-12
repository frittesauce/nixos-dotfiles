{ config, pkgs, ... }:

 {

  programs.starship.enable = true;
  programs.zoxide.enable = true;


  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = builtins.readFile ../dotfiles/.zshrc;
  };

  home.file = {
    ".config/starship.toml".source = ../dotfiles/starship.toml;
  };

}