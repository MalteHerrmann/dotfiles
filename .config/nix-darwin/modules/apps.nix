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
    # editors
    neovim

    # image editing
    gimp

    # programming languages
    go
    gofumpt
    golangci-lint

    python3
    uv

    rustup

    nodejs
    yarn

    # dev tooling
    bat
    du-dust
    eza
    fzf
    gh
    jq
    # TODO: add required fonts to nix-darwin configuration
    oh-my-posh
    ripgrep
    stow
    tmux
    tree
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
    brews = [];

    # Equivalent to `brew install --cask`
    casks = [
      "arc" # main browser
      "bartender" # cleaner menu bar
      "cursor" # ai editor
      "docker"
      "goland" # go ide
      "nikitabobko/tap/aerospace" # window manager
      "notion" # work document system
      "notion-calendar" # calendar for work and private
      "obsidian" # note taking
      "raycast" # spotlight utilities
      "slack" # work comms
      "telegram" # work comms
      "zed" # general GUI editor
    ];
  };
}
