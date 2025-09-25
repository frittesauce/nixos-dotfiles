{ pkgs, ...}: 

{ 
 environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    bluez
    blueman
    home-manager
    os-prober  
    git
    fastfetch
    rofi
    swww
    megacmd
    sddm-astronaut
    brightnessctl
    bun
    wl-clipboard
    grim
    nodejs
    tree
    vesktop
    waypaper
    neovim
    vscode
    megacmd
    gcc
    cargo
    pavucontrol
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
    obsidian
  ];

  nixpkgs.config.allowUnfree = true;


  programs = {
    firefox.enable = true; 
    zsh.enable = true;
    thunar.enable = true;
    hyprland.enable = true;
  };

  services = {
    printing.enable = true; 
  };

  security = {
    rtkit.enable = true;
  }


  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}