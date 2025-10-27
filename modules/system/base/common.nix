{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    home-manager
    neovim
    stow
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
    obs-studio
    cargo
    gh
    pavucontrol
    prismlauncher
    # discord
    vesktop
    code-cursor
    ngrok
    sqlite
    gnumake
    pkg-config
    zlib
    openssl
    gmp
    readline
    rustc
    rustfmt
    libyaml
    obsidian
    rust-analyzer
    lazygit
    pipewire
    pokeget-rs
    kitty
    fd
    libnotify
    openssl

    tree-sitter

    svelte-language-server
    typescript-language-server
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
