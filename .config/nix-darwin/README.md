# Nix-Darwin Configuration for Work Laptop

This `nix-darwin` configuration is based on the following kickstarter template:
https://github.com/ryan4yin/nix-darwin-kickstarter/blob/main/minimal/flake.nix

More information about the contents can be found in the corresponding README file on GitHub.

## Build

To build the configuration, run the following command:

```
HOSTNAME="Maltes-MacBook-Pro.local"
nix build .#darwinConfigurations.$HOSTNAME.system \
 	--extra-experimental-features 'nix-command flakes'

./result/sw/bin/darwin-rebuild switch --flake .#$HOSTNAME
```
