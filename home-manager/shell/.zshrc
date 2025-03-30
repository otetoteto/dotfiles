alias cl='clear'
alias relogin='exec $SHELL -l'
alias -g NOERR='2>/dev/null'

export FZF_DEFAULT_OPTS="--height 70% --border --cycle --reverse --inline-info --preview-window=down --preview 'bat --style=numbers --color=always {} 2>/dev/null || echo {}'"

eval "$(sheldon source)"
eval "$(/opt/homebrew/bin/brew shellenv)"

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*default' menu select=1

function chpwd() {
	lsd
}

function move_ghq() {
	local selected_dir=$(ghq list -p | fzf --preview 'bat --style=numbers --color=always {}/README.md 2>/dev/null || echo "{} has no README.md"')
	if [[ -n "$selected_dir" ]]; then
		BUFFER="cd ${selected_dir}"
		zle accept-line
	fi
	zle clear-screen
}

zle -N move_ghq
bindkey '^]' move_ghq