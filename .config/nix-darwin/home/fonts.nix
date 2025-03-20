{ config, lib, pkgs, ... }: {

  # TODO: check if this actually needs to be the "locked" version? Why not use 24.11 as well?
  home.packages = with pkgs.unstable-locked; [
    # TODO: check if fonts that are used in the configuration can be installed here?
    #
    # # https://github.com/be5invis/Iosevka/releases
    # # https://github.com/NixOS/nixpkgs/blob/master/pkgs/data/fonts/iosevka/default.nix
    # # https://github.com/NixOS/nixpkgs/blob/master/pkgs/data/fonts/iosevka/variants.nix
    # (callPackage ./../pkgs/patch-nerd-fonts {
    #   font = iosevka-bin.override { variant = "Etoile"; };
    # })
    # (callPackage ./../pkgs/patch-nerd-fonts {
    #   font = iosevka-bin.override { variant = "SGr-IosevkaTermCurlySlab"; };
    # })
  ];
}
