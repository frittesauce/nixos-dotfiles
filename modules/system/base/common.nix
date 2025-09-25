{ pkgs, ...}: 

{ 
 environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
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
    vesktop
    neovim
    vscode
    megacmd
    gcc
    cargo
    pavucontrol
    discord
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
    rustup
    spotify
    obsidian
  ];

  nixpkgs.config.allowUnfree = true;


  programs = {
    firefox.enable = true; 
    zsh.enable = true;
    thunar.enable = true;
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