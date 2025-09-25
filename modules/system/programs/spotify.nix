{ ... }:
{
  imports = [
    spicetify-nix.nixosModules.spicetify
  ];


  programs.spicetify = {
    enable = true;

    # optional settings:
    enabledExtensions = with spicetify-nix.packages.extensions; [
      adblockify
      hidePodcasts
      shuffle
    ];

    theme = spicetify-nix.packages.themes.catppuccin;
    colorScheme = "mocha";
  };
}