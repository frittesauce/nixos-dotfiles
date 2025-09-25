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
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
    };
  };

  services.blueman.enable = true;
  

  boot.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" ];

  services.xserver.videoDrivers = [ "nvidia" ];

  networking.hostName = "nixos"; 

  networking.networkmanager.enable = true;

  services.xserver.enable = true;

  services.desktopManager.gnome.enable = true;


  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
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
