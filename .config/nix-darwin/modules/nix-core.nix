{ pkgs, ... }:
{
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];

    substituters = [
      # "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://nix-community.cachix.org"
    ];
    # TODO: check if this is required? What is it used for?
    builders-use-substitutes = true;
  };

  # Auto-upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
}
