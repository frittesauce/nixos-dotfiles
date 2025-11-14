{ inputs, pkgs, ... }:
{
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  services.vicinae = {
    enable = true;
    autoStart = true;

    settings = {

      faviconService = "twenty"; # twenty | google | none
      font.size = 12;
      font.name = "ComicShannsMono NerdFont";
      popToRootOnClose = false;
      rootSearch.searchFiles = false;
      theme.name = "catppuccin-mocha";
      window = {
        csd = true;
        opacity = 0.6;
        rounding = 10;
      };
    };
  };
}
