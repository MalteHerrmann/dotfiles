{ pkgs, ... }:
{
  fonts = {
    # Install the specific fonts
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "InconsolataGo" ]; })
    ];
  };
}
