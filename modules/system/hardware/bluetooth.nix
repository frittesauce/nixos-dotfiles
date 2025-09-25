{  pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    blueman
    bluez
    playerctl
  ];

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}