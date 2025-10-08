{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      spicetify-nix,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        boogieman = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            inputs.home-manager.nixosModules.default
            ./hosts/boogieman/configuration.nix
          ];
        };
        farmslop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            inputs.home-manager.nixosModules.default
            ./hosts/farmslop/configuration.nix
          ];
        };
      };
    };
}
