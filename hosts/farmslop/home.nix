{
  config,
  inputs,
  pkgs,
  ...
}:

{

  imports = [
    ../../homeModules/default.nix
  ];

  home.username = "farmslop";
  home.homeDirectory = "/home/farmslop";

  programs.git = {
    enable = true;
    userName = "frittesauce";
    userEmail = "181068943+frittesauce@users.noreply.github.com";
  };

  home.stateVersion = "24.11";

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
  };

  home.file = {
  };

  home.sessionVariables = {
    TERMINAL = "kitty";
  };

  programs.home-manager.enable = true;
}
