{
  description = "Nix for macOS configuration";

  # format https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html#examples
  inputs = {
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    mkAlias = {
      url = "github:reckenrode/mkAlias";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    # TODO: check if this is required? not sure if this is used anywhere after removing some stuff from pre-existing setup here
    nixpkgs-locked.url =
      "github:NixOS/nixpkgs/1042fd8b148a9105f3c0aca3a6177fd1d9360ba5";

    # TODO: check if this needs to be forked?
    # TODO: this could potentially be used, but not for now
    # nix-home-manager.url = "github:torgeir/nix-home-manager";
    dotfiles.url = "github:MalteHerrmann/dotfiles";
  };

  outputs = inputs@{ self, nixpkgs, darwin, home-manager, nix-home-manager
    , dotfiles, ... }: {
      # TODO: what is this bekk-mac ID?
      darwinConfigurations."bekk-mac-03257" = darwin.lib.darwinSystem {
        system = "aarch64-darwin"; # apple silicon
        specialArgs = { inherit inputs; };
        modules = [
          {
            nixpkgs.overlays = [
              # TODO: remove Firefox config
              # pkgs.firefox-bin
              # inputs.nixpkgs-firefox-darwin.overlay

              # use selected unstable packages with pkgs.unstable.xyz
              # https://discourse.nixos.org/t/how-to-use-nixos-unstable-for-some-packages-only/36337
              # "https://github.com/ne9z/dotfiles-flake/blob/d3159df136294675ccea340623c7c363b3584e0d/configuration.nix"
              (final: prev: {
                unstable =
                  import inputs.nixpkgs-unstable { system = prev.system; };
              })

              (final: prev: {
                # pkgs.unstable-locked.<something>
                unstable-locked =
                  import inputs.nixpkgs-locked { system = prev.system; };
              })

              (final: prev: {
                # https://github.com/nix-community/home-manager/issues/1341#issuecomment-1468889352
                mkAlias =
                  inputs.mkAlias.outputs.apps.${prev.system}.default.program;
              })

            ];
          }
          ./modules/nix-core.nix
          ./modules/system.nix
          ./modules/apps.nix
          ./modules/host-users.nix

          # TODO: create fork here? what is this exactly used for?
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # TODO: is this needed?
            # home-manager.users.torgeir = import ./home;

            home-manager.extraSpecialArgs = {
              inherit inputs;
              dotfiles = dotfiles;
              # hack around nix-home-manager causing infinite recursion
              # TODO: I think this can be removed .. 
              isLinux = false;
            };
          }
        ];
      };
    };
  };
}
