export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
export PGHOST="/var/run/postgresql"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:${HOME}/.cargo/bin
export PATH=$PATH:/home/paashaas/.spicetify

export TMUX_CONF="$HOME/.config/tmux/tmux.conf"

alias vim="nvim"
alias ff="fastfetch"
alias rebuild="sudo nixos-rebuild switch --flake ${HOME}/nixos/#default"

HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000

# functions 
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

setopt inc_append_history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
autoload -U compinit; compinit

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
