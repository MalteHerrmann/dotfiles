{ pkgs, ... }:
{
  ###################################################################################
  #
  #  macOS's System configuration
  #
  #  All the configuration options are documented here:
  #    https://daiderd.com/nix-darwin/manual/index.html#sec-options
  #
  ###################################################################################
  system = {
    stateVersion = 5;

    # activationScripts are executed every time you boot the system or
    # run `darwin-rebuild`
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    # TODO: add more settings here, check e.g. https://github.com/torgeir/nix-darwin/blob/main/modules/system.nix#L5-L71

    defaults = {
      dock = {
        # Group windows by application in Mission Control
        expose-group-apps = true;
      };

      trackpad = {
        # tap to click
        Clicking = true;
        # tap-tap-drag to drag
        Dragging = false;
        # two-finger-tap right click
        TrackpadRightClick = true;
      };

      NSGlobalDomain = {
        # enable key repeats instead of showing special characters per key (e.g. accents for e, etc.)
        ApplePressAndHoldEnabled = false;

        # fast key repeat rate when hold
        KeyRepeat = 2;
        InitialKeyRepeat = 15;
      };

      finder = {
        # bottom status bar in Finder
        ShowStatusBar = true;
        ShowPathbar = true;
      };

      # other macOS defaults configuration
      # ...
    };
  };

  # Add ability to use TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  # This is required if you want to use darwin's default shell - zsh
  programs.zsh.enable = true;
}
