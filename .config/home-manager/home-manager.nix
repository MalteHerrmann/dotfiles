{ config, pkgs, libs, ... }:
{
  # allow proprietary software to be built for individual cases
  nixpkgs.config.allowUnfreePredicate = (_: true);

  home.packages = with pkgs; [
    # terminals
    alacritty
    oh-my-posh

    # productivity
    obsidian

    # programming languages
    go

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
