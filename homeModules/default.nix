{
  inputs,
  pkgs,
  config,
  ...
}:

{
  services.gnome-keyring.enable = true;

  imports = [
    ./shell
    ./desktopEnviorments/hyprland
    ./syncthing
    ./nvim
  ];
}

