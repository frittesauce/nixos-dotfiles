{ inputs, pkgs, config, ...}:

{
  imports = [
    ./shell
    ./terminals/kitty
  ];
}