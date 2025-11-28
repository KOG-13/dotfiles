HISTSIZE=5000
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

HISTFILE="${XDG_DATA_HOME}/zsh/history"
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::git
zinit snippet OMZP::command-not-found

# bind autosuggestion to ctrl f
bindkey '^f' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-flags '--height=50%'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'lsd $realpath'
#zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-flags '--height=50%'

alias l="lsd -lh"
alias ls="lsd"
alias ll="lsd -l"
alias lh="ls -ld .??*"
alias lt="tree -L 1"
alias cdl='cd && clear'
alias cl='clear'
alias fetch='fastfetch'
alias v='nvim'
alias vim='nvim'
alias wget='wgwt --hsts-file="XDG_CACHE_HOME/wget-hsts"'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# fzf integration
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

pokemon-colorscripts --random
