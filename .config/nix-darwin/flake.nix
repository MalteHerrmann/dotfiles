{
  description = "Nix for macOS configuration";

  # NOTE: this nix configuration is only adjusting this flake, it's not being used globally
  nixConfig = {
    substituters = [
      # # NOTE: we're querying the USTC mirror first,
      # # and only then the offical cache to avoid overloading it.
      # "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
  };

  # This is the standard format for flake.nix. `inputs` are the dependencies of the flake,
  # Each item in `inputs` will be passed as a parameter to the `outputs` function after being pulled and built.
  inputs = {
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-25.05-darwin";
    darwin = {
      url = "github:lnl7/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    darwin,
    ...
  }: let
    system = "aarch64-darwin";

    # Configuration for different machines
    configs = {
      "Maltes-MacBook-Air" = {
        username = "malte";
        hostname = "Maltes-MacBook-Air";
      };
      "Maltes-MacBook-Pro" = {
        username = "malteherrmann";
        hostname = "Maltes-MacBook-Pro";
      };
    };

    # Function to create darwin configuration for a given hostname
    makeDarwinConfig = hostname: config: darwin.lib.darwinSystem {
      inherit system;
      specialArgs = inputs // {
        inherit (config) username hostname;
      };
      modules = [
        ./modules/nix-core.nix
        ./modules/system.nix
        ./modules/apps.nix
        ./modules/fonts.nix
        ./modules/host-users.nix
      ];
    };
  in {
    # Generate configurations for all defined machines
    darwinConfigurations = builtins.mapAttrs makeDarwinConfig configs;

    # nix code formatter
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
