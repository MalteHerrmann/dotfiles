{ pkgs, ... }: {

  home.packages = with pkgs; [

    # TODO: check using colima, could be interesting?
    #
    # # nix 23.11 is colima 0.5.6
    # # https://github.com/abiosoft/colima/issues/913
    # # try unstable which is colima 0.6.7
    # pkgs.unstable.colima # colima start --edit to tune its resources

    docker
    docker-compose
    docker-credential-helpers
  ];

}
