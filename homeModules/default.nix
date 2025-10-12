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
  services.gnome-keyring.enable = true;

  home.packages = [
    inputs.zen-browser.packages."${system}".twilight
  ];

  imports = [
    ./shell
    ./desktopEnviorments/hyprland
    ./syncthing
    ./nvim
    ./font.nix
  ];
}
