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
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    darwin,
    ...
  }: let
    username = "malteherrmann";
    system = "aarch64-darwin";
    hostname = "Maltes-MacBook-Pro.local";

    specialArgs =
      inputs
      // {
        inherit username hostname;
      };
  in {
    darwinConfigurations."${hostname}" = darwin.lib.darwinSystem {
      inherit system specialArgs;
      modules = [
        ./modules/nix-core.nix
        ./modules/system.nix
        ./modules/apps.nix

        ./modules/host-users.nix
      ];
    };

    # nix code formatter
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
