{ pkgs, inputs, ... }:

{

  environment.systemPackages = with pkgs; [
    hyprlang
    hyprland
    hyprlock
    hyprpicker
    hyprcursor

    waypaper
    swww

    rose-pine-hyprcursor

    wl-clipboard-rs
    slurp
    grim

  ];

  programs.hyprland = {
    enable = true;
    withUWSM = false;
    xwayland.enable = true;
  };

}
