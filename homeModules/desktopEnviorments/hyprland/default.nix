{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    ./bar
  ];

  programs.hyprlock.enable = true;

}
