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
  (inputs.caelestia-shell.packages.${pkgs.system}.default)
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
      name = "Breeze";
      size = 48;
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
    XCURSOR_THEME = "Breeze";
    XCURSOR_SIZE = "48";
  };

  programs.home-manager.enable = true;

}
