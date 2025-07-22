{ config, pkgs, libs, ... }:
{
  # allow proprietary software to be built for individual cases
  nixpkgs.config.allowUnfreePredicate = (_: true);

  home.packages = with pkgs; [
    # terminal stuff
    oh-my-posh

    # productivity
    obsidian
    bartender

    # image editing
    gimp

    # programming languages & related tools
    go
    gofumpt

    # # TODO: Rust is not really working nicely with Nix out of the box,
    # # people are building some overlays, etc. to get it to work
    # # 
    # # Some info can be found here:
    # # https://stackoverflow.com/questions/40604084/cant-access-environment-variable-in-rust
    # #
    # # And some example of an Nix overlay for Rust:
    # # https://github.com/oxalica/rust-overlay
    #
    # rustc
    # cargo
    # rust-analyzer
    # clippy

    python3
    pylint
    black
    uv
    ffmpeg-full

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
    fd
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
