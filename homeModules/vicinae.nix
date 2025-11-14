{ inputs, pkgs, ... }:
{
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  services.vicinae = {
    enable = true;
    autoStart = true;

    setings = {

      faviconService = "twenty"; # twenty | google | none
      font.size = 12;
      popToRootOnClose = false;
      rootSearch.searchFiles = false;
      theme.name = "catppuccin-mocha";
      window = {
        csd = true;
        opacity = 0.7;
        rounding = 10;
      };
    };
  };
}
