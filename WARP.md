# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository that manages system configurations using a hybrid approach:
- **Nix** for package management and system configuration
- **GNU Stow** for creating symlinks to configuration files
- **Home Manager** for user-specific package and configuration management
- **Nix-Darwin** for macOS system-level configuration

## Initial Setup Commands

Install prerequisites and set up the environment:

```bash
# Clone the repository
cd $HOME
git clone https://github.com/MalteHerrmann/dotfiles
cd dotfiles

# Create symlinks for configuration files
stow .
```

## Nix Configuration Management

### Home Manager (User-level packages and config)

```bash
# Navigate to home-manager config
cd .config/home-manager

# Apply home-manager configuration changes
home-manager switch --flake .#malte

# Check current home-manager generation
home-manager generations

# Roll back to previous generation (if needed)
home-manager switch --flake .#malte --rollback
```

### Nix-Darwin (System-level configuration for macOS)

```bash
# Navigate to nix-darwin config
cd .config/nix-darwin

# Deploy system configuration (uses Makefile)
make deploy

# Manual build and switch (alternative)
nix build .#darwinConfigurations.$(hostname).system --extra-experimental-features 'nix-command flakes'
sudo ./result/sw/bin/darwin-rebuild switch --flake .#$(hostname)
```

## Development Environment

### Shell Environment
The repository configures zsh with several productivity enhancements:
- **oh-my-posh** for shell theming
- **zoxide** for smart directory navigation
- **fzf** for fuzzy finding
- Custom aliases for git, docker, and development workflows

### Key Aliases Available
- `gcam` - git commit -a -m
- `gd` - git diff  
- `gdp` - interactive git diff with fzf preview
- `ll`, `la`, `ls` - eza-based directory listings
- `v`, `vim` - neovim
- `mt`, `ml` - make test, make lint
- `nd` - nix develop

## Configuration Structure

### Core Configuration Files
- `.zshrc` - Shell configuration with aliases and tool initialization
- `.config/home-manager/home-manager.nix` - User packages and home configuration
- `.config/home-manager/flake.nix` - Home Manager flake definition
- `.config/nix-darwin/flake.nix` - System-level Darwin configuration

### Application Configurations
The `.config/` directory contains configurations for:
- **Editors**: nvim, helix, zed
- **Terminal**: alacritty, kitty, tmux, zellij
- **Window Management**: yabai, skhd, aerospace
- **Development**: git, github-copilot
- **Shell**: oh-my-posh themes

### Multi-Machine Support
Nix-Darwin configuration supports multiple machines:
- `Maltes-MacBook-Air` (username: malte)
- `Maltes-MacBook-Pro` (username: malteherrmann)

Configurations automatically adapt based on hostname.

## Package Management Philosophy

### Managed via Home Manager
Core development tools are managed through Nix/Home Manager:
- **Languages**: Go, Python, Node.js
- **Editors**: Neovim, Helix, Zed
- **CLI Tools**: bat, eza, fzf, ripgrep, gh, jq
- **Development**: tmux, stow, uv (Python package manager)

### Notes on Rust
Rust toolchain is intentionally not managed via Nix due to complexity with overlays and environment variables. Install separately using rustup.

## Common Development Workflows

### Updating Configurations
1. Edit relevant `.nix` files
2. For user packages: `home-manager switch --flake .#malte`
3. For system settings: `make deploy` (in nix-darwin directory)

### Adding New Packages
Add packages to `home.packages` in `.config/home-manager/home-manager.nix`, then run `home-manager switch --flake .#malte`

### Configuration Rollbacks
Both Home Manager and Nix-Darwin support rollbacks to previous generations if issues occur.

## Special Considerations

### Nix Flakes
All configurations use Nix flakes with pinned versions:
- Home Manager pinned to `nixpkgs-25.05-darwin` and `home-manager/release-25.05`
- Nix-Darwin pinned to `nixpkgs-25.05-darwin` and `nix-darwin-25.05`

### Path Management
The shell configuration adds several paths:
- Go binary path: `$(go env GOPATH)/bin`  
- Cargo binary path: `$HOME/.cargo/bin`
- Local binaries: `$HOME/.local/bin`

### Google Cloud Integration
Includes conditional loading of Google Cloud SDK tools for specific user accounts.