{ pkgs, ... }:
{
  fonts = {
    # Enable font management
    fontDir.enable = true;
    
    # Install the specific fonts
    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "InconsolataGo" ]; })
    ];
  };
}