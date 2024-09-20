# Based on https://github.com/nix-community/home-manager#nix-flakes
{
  description = "Home Manager flake";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-24.05-darwin"; # NOTE: we pin this version for 24.05
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable"; # NOTE: unstable releases
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # set up devenv (https://devenv.sh/getting-started/)
    devenv.url = "github:cachix/devenv";
  };

  outputs = { nixpkgs, home-manager, devenv, ... }@inputs: {
    homeConfigurations = {
      malte = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        modules = [
          ./home-manager.nix
          {
            home = {
              username = "malte";
              homeDirectory = "/Users/malte";
              # stateVersion = "24.05";
              stateVersion = "24.11"; # current unstable version
            };
          }
        ];
        extraSpecialArgs = { inherit devenv; };
      };
    };
  };
}
