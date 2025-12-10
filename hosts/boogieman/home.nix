{
  config,
  inputs,
  pkgs,
  ...
}:

{

  imports = [
     ../../homeModules/default.nix
    inputs.caelestia-shell.homeManagerModules.default ];


    programs.caelestia = {
      enable = true;

      settings = {
        # just an example, see the avaiable options in the repo's README
        bar.status = {
          showBattery = false;
        };
        paths.wallpaperDir = "~/Images";
      };

      cli = {
        enable = true;
        settings = {
          # see avaiable options in caelestia-dots/cli
          theme.enableGtk = false;
        };
      };
    };

  home.username = "boogieman";
  home.homeDirectory = "/home/boogieman";

  programs.git = {
    enable = true;
    userName = "frittesauce";
    userEmail = "181068943+frittesauce@users.noreply.github.com";
  };

  home.stateVersion = "24.11";


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
