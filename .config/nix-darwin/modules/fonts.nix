{ pkgs, ... }:
{
  fonts = {
    # Install the specific fonts
    packages = with pkgs; [
      nerd-fonts.inconsolata-go
    ];
  };
}
