{ pkgs, ... }:

{
   environment.systemPackages = with pkgs; [
    hyprlang
    hyprland
    hyprlock
    hyprpicker
    
    waypaper
    swww

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