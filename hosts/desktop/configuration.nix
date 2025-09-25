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

      (Module "drivers/nvidia")
      
      (Module "hardware/audio")
    ];

  system.stateVersion = "25.05";


  home-manager = {

    useGlobalPkgs = true;
    useUserPackages = true;

    users = {
      "farmslop" = import ./home.nix;
    };
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  services.blueman.enable = true;
  

  networking.hostName = "nixos"; 

  networking.networkmanager.enable = true;

  services.xserver.enable = true;

  services.desktopManager.gnome.enable = true;


  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.flatpak.enable = true;

  programs.steam = {
    enable = true;
  };

  users.users.farmslop = {
    isNormalUser = true;
    description = "farmslop";
    extraGroups = [ "networkmanager" "wheel" ];
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
