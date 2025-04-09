{ pkgs, ... }:
{
  # I'm using the Determinate system's Nix installer.
  # Determinate uses its own daemon to manage the Nix installation that
  # conflicts with nix-darwin’s native Nix management.
  #
  # To turn off nix-darwin’s management of the Nix installation, set:
  nix.enable = false;
}
