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
    enable = true;
    gtk4.extraCss = "@import 'colors.css';";
    gtk3.extraCss = "@import 'colors.css';";
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
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
  };

  programs.home-manager.enable = true;

}
