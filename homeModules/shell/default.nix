{ config, pkgs, ... }:

 {

  programs.starship.enable = true;
  programs.zoxide.enable = true;


  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    initExtra = builtins.readFile ./dotfiles/.zshrc;
  };

  home.file = {
    # ".zshrc".source = ./dotfiles/.zshrc;
    ".config/starship.toml".source = ./dotfiles/starship.toml;
  };

}