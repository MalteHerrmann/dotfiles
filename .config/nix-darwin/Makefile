# Build Darwin based on Nix configuration
HOSTNAME := $(shell hostname)

deploy:
	nix build .#darwinConfigurations.$(HOSTNAME).system \
		   --extra-experimental-features 'nix-command flakes'

	sudo ./result/sw/bin/darwin-rebuild switch --flake .#$(HOSTNAME)
