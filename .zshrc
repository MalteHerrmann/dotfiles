# Paths
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/bin
export VENV_DIR=$HOME/python/envs

# -------------------------------------------------------------------------------

# For a full list of active aliases, run `alias`.
# Aliases
alias ..='cd ..'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias e='evmosd'
alias eu='evmos-utils'
alias gcam='git commit -a -m'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gdp='git diff --name-only | fzf --preview "git diff --color=always -- {1}"'
alias gdps='git diff --staged --name-only | fzf --preview "git diff --staged --color=always -- {1}"'
alias gdpl='git diff HEAD~1 HEAD --name-only | fzf --preview "git diff HEAD~1 HEAD --color=always -- {1}"'
alias glo='git log --oneline'
alias glof='git log --oneline | fzf'
alias gpo='git pull origin'
alias gpl='git pull'
alias gps='git push'
alias gs='git status'
alias h='hanchond'
alias hp='hanchond playground'
alias la='eza -la'
alias lf='eza -lah'
alias ll='eza -l'
alias ls='eza'
alias mcl='make check-licenses'
alias ml='make lint'
alias mt='make test'
alias mtu='make test-unit'
alias mtc='make test-cover'
alias nd='nix develop'
alias pip='pip3'
alias py='python3'
alias python='python3'
alias t='tmux'
alias ta='tmux attach'
alias td='tmux detach'
alias v='nvim'
alias vim='nvim'

# if nix is used, then hardcode python3 to use the nix version
if [ -f "$HOME/.nix-profile/bin/python3" ]; then
    alias python3="$HOME/.nix-profile/bin/python3"
fi

# Enable GitHub CLI autocompletion as described in 
# https://cli.github.com/manual/gh_completion
autoload -U compinit
compinit -i

# --------------------
# CLI tools
#

# Set up oh-my-posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    if command -v oh-my-posh >/dev/null 2>&1; then
        # eval "$(oh-my-posh init zsh)"
        # eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/catppuccin.omp.json)"
        # eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/blueish_reduced.omp.json)"
        # eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/avit.omp.json)"
        eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/amro.omp.json)"
        # eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/catpuccin-frappe.omp.json)"
        # eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/bubblesextra.omp.json)"
    else
        echo "oh-my-posh not found, skipping theme initialization."
    fi
fi

# Set up zoxide
eval "$(zoxide init zsh)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# --------------------
# Nix
#

# # Fix Nix installation after system upgrades
# # TODO: we'll have to see if this is required after installing Nix with Determinate Systems installer (https://github.com/DeterminateSystems/nix-installer)
# if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
#   . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
# fi

# Load nix session vars if it exists
if [ -f '$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh' ]; then
  source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/malteherrmann/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/malteherrmann/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/malteherrmann/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/malteherrmann/google-cloud-sdk/completion.zsh.inc'; fi
