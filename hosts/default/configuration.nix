{ pkgs, ... }:
let
  systemDir = ../../modules/system;
  Module = name: systemDir + "/${name}.nix";
  Default = name: systemDir + "/${name}/default.nix";
in
{
  imports = [
    ./hardware-configuration.nix
    (Default "base")
    (Default "boot")
    (Default "desktop")

    (Module "hardware/audio")
    (Module "hardware/bluetooth")
    (Module "hardware/common")
    (Module "hardware/network")

    (Module "services/flatpak")
    (Module "services/syncthing")

    (Module "programs/spotify")

    (Module "code/kotlin")
  ];

  system.stateVersion = "25.05";

  home-manager = {

    useGlobalPkgs = true;
    useUserPackages = true;

    users = {
      "boogieman" = import ./home.nix;
    };
  };

  services.desktopManager.gnome.enable = true;

  users.users.boogieman = {
    isNormalUser = true;
    description = "boogieman";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  services.mpd = {
    enable = true;
    musicDirectory = "/home/user/Music/synced";
    extraConfig = ''
      audio_output {
         type "pipewire"
         name "PipeWire MPD Output"
       }      
    '';
  };
}
