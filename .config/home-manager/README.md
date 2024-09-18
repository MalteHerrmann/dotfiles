# Nix Home Manager Setup

- Followed this video tutorial: https://www.youtube.com/watch?v=1dzgVkgQ5mE
- Home Manager Repo: https://github.com/nix-community/home-manager

**NOTE:** There have been some updates to `home-manager` since the linked video was shot.
Some relevant changes are discussed in this section on simplifying the home information here:
https://nix-community.github.io/home-manager/release-notes.xhtml#sec-release-22.11-highlights

By default, the setup from `home-manager` will create a `home.nix` file.
However, the setup in this folder is relying on Nix flakes.
Therefore, the `flake.nix` contains the relevant information that would otherwise be stored within the original `home.nix` file.

## Relevant Commands

- Update the most recent changes to the home manager flake: `home-manager switch --flake .#malte`
- Any packages that shall be install need to be defined within the `home.packages` property.

