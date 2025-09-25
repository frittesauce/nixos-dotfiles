# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      # ./main-user.nix
    ];

  # main-user.enable = "true";
  # main-user.userName = "boogieman";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # Bootloader.
  boot.loader.systemd-boot.enable = false;

  boot.loader.grub = {
	enable = true;
	efiSupport = true;
        devices = [ "nodev" ];
        useOSProber = false;  # 👈 Important line 
	

    extraEntries = ''
    menuentry "Arch Linux (old install)" {       
      set root='hd0,gpt2'
      linux /boot/vmlinuz-linux root=UUID=aff15c26-0ce5-42b5-9c00-4109ca82bc80 rw init=/usr/lib/systemd/systemd
      initrd /boot/initramfs-linux.img
    }      
    '';	
  };


  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  services.blueman.enable = true;
  
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = false;
  services.displayManager.ly = {
    enable = true;
    };

  services.desktopManager.gnome.enable = true;

  systemd = {
  user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
  };
};

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  programs.hyprland.enable = true;
  services.flatpak.enable = true;

  users.users.boogieman = {
    isNormalUser = true;
    description = "boogieman";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
     helix
     vesktop
     waypaper
     neovim
     vscode
     megacmd
     gcc
     cargo
     pavucontrol
     steam
     discord
     code-cursor
     ngrok
     slurp
     ruby
     sqlite
      gnumake
      pkg-config
      zlib
      openssl
      gmp
      readline
      rustc
      libyaml
      rustup
      spotify
      playerctl
      android-studio
      unzip
    ];
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


  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "boogieman" = import ./home.nix;
    };
  };

  programs.firefox.enable = true;
  programs.zsh.enable = true;
  programs.thunar.enable = true;

  nixpkgs.config.allowUnfree = true;

 

  system.stateVersion = "25.05"; # Did you read the comment?

}
