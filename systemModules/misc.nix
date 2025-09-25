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
    banana-cursor
  ];
}