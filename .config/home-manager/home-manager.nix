{ config, pkgs, libs, ... }:
{
  # allow proprietary software to be built for individual cases
  nixpkgs.config.allowUnfreePredicate = (_: true);

  home.packages = with pkgs; [
    # terminal stuff
    oh-my-posh

    # terminals
    warp-terminal

    # productivity
    obsidian
    raycast
    bartender

    # image editing
    gimp

    # programming languages & related tools
    go
    gofumpt

    rustc
    cargo
    rust-analyzer

    python3
    pylint
    black

    nodejs
    yarn

    # editors
    helix
    neovim
    zed-editor

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
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
