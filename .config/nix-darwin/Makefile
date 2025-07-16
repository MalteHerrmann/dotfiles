# Build Darwin based on Nix configuration
HOSTNAME="Maltes-MacBook-Pro"

deploy:
	nix build .#darwinConfigurations.$(HOSTNAME).system \
		   --extra-experimental-features 'nix-command flakes'

	./result/sw/bin/darwin-rebuild switch --flake .#$(HOSTNAME)
