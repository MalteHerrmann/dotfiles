{ config, inputs, pkgs, lib, ... }:

let dotfiles = inputs.dotfiles;
in {

  # moar https://github.com/yuanw/nix-home/blob/main/modules/macintosh.nix

  # import sub modules
  imports = [
    # TODO: check if this is actually required? Seems to copy some of the applications from the Nix store to the actual `/Applications` path
    # ./link-home-manager-installed-apps.nix
    ./docker.nix

    # TODO: check if this is good to use? Not sure I need the GNU PG stuff
    # ./gw.nix
    # ./gpg.nix

    ./fonts.nix
    (inputs.nix-home-manager + "/modules")
  ];

  # TODO: remove firefox implementation
  # programs.t-firefox = {
  #   enable = true;
  #   package = pkgs.firefox-devedition-bin;
  #   extraEngines = (import ./firefox-da.nix { });
  # };
  programs.t-nvim.enable = true;
  programs.t-terminal.alacritty = {
    enable = true;
    package = pkgs.unstable.alacritty;
  };
  programs.t-tmux.enable = true;
  programs.t-zoxide.enable = true;
  programs.t-shell-tooling.enable = true;
  programs.t-git = {
    enable = true;
    # gh version >2.40.0
    # https://github.com/cli/cli/issues/326
    ghPackage = pkgs.unstable.gh;
  };

  # home manager needs this
  home = {
    username = "MalteHerrmann";
    homeDirectory = "/Users/malteherrmann";
    stateVersion = "24.11";
  };

  # https://github.com/NixOS/nixpkgs/blob/master/pkgs/os-specific/darwin/
  home.packages = with pkgs; [
    coreutils

    # TODO: use aerospace instead of yabai
    # pkgs.unstable.yabai
    # pkgs.unstable.skhd
  ];

  # TODO hardware.keyboard.zsa.enable

  home.file = {
    ".config/dotfiles".source = dotfiles;

    # TODO: check if using SwiftBar would be interesting? https://github.com/swiftbar/SwiftBar
    # ".config/dotfiles".onChange = ''
    #   echo "Fixing swiftbar path"
    #   /usr/bin/defaults write com.ameba.Swiftbar PluginDirectory \
    #     $(/etc/profiles/per-user/torgeir/bin/readlink ~/.config/dotfiles)/swiftbar/scripts
    #   echo swiftbar plugin directory is $(/usr/bin/defaults read com.ameba.Swiftbar PluginDirectory)
    # '';

    # TODO: check what this is doing exactly?
    "Library/KeyBindings/DefaultKeyBinding.dict".source = dotfiles
      + "/DefaultKeyBinding.dict";

    # TODO: remove idea vim stuff? Currently I'm not storing any global JetBrains vim config stuff
    ".ideavimrc".source = dotfiles + "/ideavimrc";

    # TODO: remove yabai and skhd stuff
    # ".yabairc".source = dotfiles + "/yabairc";
    # ".yabairc".onChange =
    #   "/etc/profiles/per-user/torgeir/bin/yabai --restart-service";

    # ".skhdrc".source = dotfiles + "/skhdrc";
    # ".skhdrc".onChange =
    #   "/etc/profiles/per-user/torgeir/bin/skhd --restart-service";
  };
}
