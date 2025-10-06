{ pkgs, ...}: 

{ 
 environment.systemPackages = with pkgs; [
    home-manager
    git
    fastfetch
    rofi
    swww
    megacmd
    sddm-astronaut
    brightnessctl
    bun
    nodejs
    tree
    vscode
    megacmd
    gcc
    cargo
    gh
    pavucontrol
    # discord
    vesktop
    code-cursor
    ngrok
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
    obsidian
    lazygit
    pipewire
    pokeget-rs
  ];

  nixpkgs.config.allowUnfree = true;


  programs = {
    firefox.enable = true; 
    zsh.enable = true;
    thunar.enable = true;
    steam.enable = true;
  };

  services = {
    printing.enable = true; 
  };

  security = {
    rtkit.enable = true;
  };


  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    package = pkgs.nix;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
