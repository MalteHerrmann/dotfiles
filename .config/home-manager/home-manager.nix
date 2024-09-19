{ config, pkgs, libs, ... }:
{
  # allow proprietary software to be built for individual cases
  nixpkgs.config.allowUnfreePredicate = (_: true);

  home.packages = with pkgs; [
    # terminal stuff
    #
    # TODO: currently terminals and other GUI apps are installed with brew,
    # because they would not be picked up by Spotlight and fail to correctly
    # load their configs.

    # productivity
    obsidian

    # programming languages
    go
    python3

    # editors
    helix

    # other dev tools
    du-dust
    eza
    fzf
    jq
    stow
    tmux
    tree
    zoxide
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
