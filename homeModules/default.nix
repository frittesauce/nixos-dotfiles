{ inputs, pkgs, config, ...}:

{
  imports = [
    ./shell
    ./desktopEnviorments/hyprland
  ];
}