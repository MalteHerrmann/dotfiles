# Based on https://github.com/nix-community/home-manager#nix-flakes
{
  description = "Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-25.05-darwin"; # NOTE: we pin this version for 25.05
    # nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable"; # NOTE: unstable releases
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {
    homeConfigurations = {
      malte = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.aarch64-darwin;
        modules = [
          ./home-manager.nix
          {
            home = {
              username = "malte";
              homeDirectory = "/Users/malte";
              stateVersion = "25.05"; # current unstable version
            };
          }
        ];
      };
    };
  };
}
