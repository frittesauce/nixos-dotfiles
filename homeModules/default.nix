{
  inputs,
  pkgs,
  config,
  ...
}:

let
  system = "x86_64-linux";
in
{

  home.packages = [
    inputs.zen-browser.packages."${system}".twilight
    pkgs.matugen
  ];

  imports = [
    ./shell
    ./vicinae.nix
    ./desktopEnviorments/hyprland
    ./syncthing
    ./nvim
    ./font.nix
  ];
}
