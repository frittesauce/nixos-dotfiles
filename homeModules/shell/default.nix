{ config, pkgs, ... }:

 {

  imports = [
    ./tmux.nix
    ./yazi.nix
    ./fastfetch.nix
  ];

  programs.starship.enable = true;
  programs.zoxide.enable = true;



  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = builtins.readFile ./.zshrc;
  };

}