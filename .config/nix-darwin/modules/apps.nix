{ pkgs, ... }:
{
  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  #
  # TODO Fell free to modify this file to fit your needs.
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    # image editing
    gimp

    # audio editing
    ffmpeg-full

    # programming languages
    go
    golangci-lint

    python3
    uv

    rustup

    foundry # solidity / evm toolkit

    # nodejs
    bun
    yarn

    # Security
    gnupg

    # dev tooling
    bat
    du-dust
    eza
    fd
    fzf
    gh
    jq
    # TODO: add required fonts to nix-darwin configuration
    oh-my-posh
    ripgrep
    stow
    tmux
    tree
    zellij
    zoxide
  ];

  # The apps installed by homebrew are not managed by nix, and not reproducible because of it (i.e. different version might be installed)
  # However, homebrew has a MUCH larger selection of apps than Nixpkgs, especially for GUI apps.
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      # NOTE: "zap" uninstalls all formulae that are NOT listed here.
      # cleanup = "zap";
    };

    # Equivalent to `brew install`
    brews = [
      "neovim" # terminal editor; not installing via nix to be able to update plugins more easily
      "node" # installing via brew because nix was not able to run `npm install -g` because of permission errors
    ];

    # Equivalent to `brew install --cask`
    casks = [
      # Editors
      "cursor" # ai editor
      "goland" # go ide
      "zed" # general GUI editor

      # Productivity
      "bartender" # cleaner menu bar
      "nikitabobko/tap/aerospace" # window manager
      "notion" # work document system
      "notion-calendar" # calendar for work and private
      "obsidian" # note taking
      "raycast" # spotlight utilities
      "zotero" # literature collection

      # Passwords
      "bitwarden"

      # Browser
      "arc" # main browser

      # Comms
      "slack" # work comms
      "telegram" # work comms

      # Terminal
      "ghostty" # terminal emulator

      # SSH connections for Noble
      "termius"

      # Container runners
      # "docker"
      "orbstack" # Docker replacement
    ];
  };
}
