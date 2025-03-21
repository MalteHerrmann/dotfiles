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

    defaults = {
      menuExtraClock.Show24Hour = true;

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
