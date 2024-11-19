{ config, pkgs, devenv, ... }:
{
  # allow proprietary software to be built for individual cases
  nixpkgs.config.allowUnfreePredicate = (_: true);

  home.packages = with pkgs; [
    # terminal stuff
    oh-my-posh

    # TODO: currently terminals and other GUI apps are installed with brew,
    # because they would not be picked up by Spotlight and fail to correctly
    # load their configs.

    # terminals
    kitty
    warp-terminal

    # productivity
    obsidian
    raycast
    bartender

    # image editing
    gimp

    # programming languages
    go
    rustc
    python3
    nodejs
  
    # build tools
    cargo
    yarn

    # LSPs
    rust-analyzer

    # editors
    helix
    neovim
    glow  # markdown reader

    # other dev tools
    bat
    du-dust
    eza
    fzf
    gh
    jq
    ripgrep
    stow
    tmux
    tree
    zoxide

    # set up devenv
    # TODO: this is building fine but devenv is not working
    devenv
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
