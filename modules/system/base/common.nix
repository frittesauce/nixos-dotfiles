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
    luajitPackages.magick
    mpv
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

    blockbench

    tree-sitter

    svelte-language-server

    nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server
    tailwindcss-language-server

    ruby
    rubyPackages.solargraph

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
