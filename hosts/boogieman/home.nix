{
  config,
  inputs,
  pkgs,
  ...
}:

{

  imports = [ ../../homeModules/default.nix ];

  home.username = "boogieman";
  home.homeDirectory = "/home/boogieman";

  programs.git = {
    enable = true;
    userName = "frittesauce";
    userEmail = "181068943+frittesauce@users.noreply.github.com";
  };

  home.stateVersion = "24.11";

  home.packages = [
  ];

  gtk = {
    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = (
        pkgs.catppuccin-gtk.override {
          variant = "mocha";
          accents = [ "blue" ];
          size = "standard";
          tweaks = [ "normal" ];
        }
      );
    };
    
    cursorTheme = {
      name = "catppuccin-mocha-dark-cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
      size = 24;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  home.file = {
  };

  home.sessionVariables = {
    TERMINAL = "kitty";
    XCURSOR_THEME = "catppuccin-mocha-dark-cursors";
    XCURSOR_SIZE = "24";
  };

  programs.home-manager.enable = true;

}
