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
    zed-editor
    glow  # markdown reader

    # other dev tools
    bat
    du-dust
    eza
    fzf
    gh
    gofumpt
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
