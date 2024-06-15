# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Paths
export PATH=$PATH:$(go env GOPATH)/bin
export VENV_DIR=$HOME/python/envs

# Variables
source $HOME/.env

# -------------------------------------------------------------------------------

# For a full list of active aliases, run `alias`.
# Aliases
alias ..='cd ..'
alias am='git commit -a -m'
alias df='git --git-dir=$HOME/.config/ --work-tree=$HOME'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias e='evmosd'
alias eu='evmos-utils'
alias gcam='git commit -a -m'
alias gco='git checkout'
alias gd='git diff'
alias gpo='git pull origin'
alias gpl='git pull'
alias gps='git push'
alias gs='git status'
alias la='eza -la'
alias lf='eza -lah'
alias ll='eza -l'
alias ls='eza'
alias mcl='make check-licenses'
alias ml='make lint'
alias mt='make test'
alias mtu='make test-unit'
alias mtc='make test-cover'
alias pip='pip3'
alias py='python3'
alias python='python3'
alias ta='tmux attach'
alias v='nvim'
alias vim='nvim'

# Enable GitHub CLI autocompletion as described in 
# https://cli.github.com/manual/gh_completion
autoload -U compinit
compinit -i

# Set up oh-my-posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/catppuccin.omp.json)"
fi

# Set up zoxide
eval "$(zoxide init zsh)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
