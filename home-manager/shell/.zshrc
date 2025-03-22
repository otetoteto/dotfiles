alias cl='clear'
alias fzf='fzf --layout=reverse --cycle'
alias relogin='exec $SHELL -l'

eval "$(sheldon source)"
eval "$(/opt/homebrew/bin/brew shellenv)"

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*default' menu select=1

function chpwd() {
	lsd
}

function move_ghq() {
	local selected_dir=$(ghq list -p | fzf)
	if [[ -n "$selected_dir" ]]; then
		BUFFER="cd ${selected_dir}"
		zle accept-line
	fi
	zle clear-screen
}

zle -N move_ghq
bindkey '^]' move_ghq