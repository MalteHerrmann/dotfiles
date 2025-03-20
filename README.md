# Dotfiles

This repository contains my collection of dotfiles.

## Prerequisites

### Installing `stow`

This setup is using `stow` to create symlinks for different configuration files, while still keeping all of them in one repository for easier version control.

This can be either installed using Homebrew or directly from the provided download links on the GNU website:
https://www.gnu.org/software/stow/

### Install Nix using Determinate Systems Installer

In order to apply the configuration in this repository, it is required to install the necessary tools.
Depending on the different laptop used (private/work) this will include using a flavor of **Nix**.

This should be installed using the installer provided by [Determinate Systems](https://docs.determinate.systems/getting-started/individuals/#install).

## How to reproduce

```
cd $HOME
git clone https://github.com/MalteHerrmann/dotfiles
cd dotfiles
stow .
```

## Requirements

```
brew install git
brew install stow
```

