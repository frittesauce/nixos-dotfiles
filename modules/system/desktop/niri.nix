{ pkgs, ... }:

{
  programs.niri.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-dbus-proxy
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
    gnome-keyring
    hyprlock
    swww
    xwayland-run
    xwayland-satellite
  ];

  location = {
    provider = "manual";
    latitude = 38.8977;
    longitude = 77.0365;
  };
}
