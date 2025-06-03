alias cl='clear'
alias relogin='exec $SHELL -l'
alias -g NOERR='2>/dev/null'
alias lzd='lazydocker'

export FZF_DEFAULT_OPTS="--height 70% --border --cycle --reverse --inline-info --preview-window=down --preview 'bat --style=numbers --color=always --line-range=:500 {} 2>/dev/null || echo {}'"

export PATH="$HOME/.cargo/bin:$PATH"

eval "$(sheldon source)"
eval "$(/opt/homebrew/bin/brew shellenv)"

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*default' menu select=1

function chpwd() {
	lsd
}

function move_ghq() {
	local selected_dir=$(ghq list -p | fzf --preview 'bat --style=numbers --color=always --line-range=:500 {}/README.md 2>/dev/null || echo "{} has no README.md"')
	if [[ -n "$selected_dir" ]]; then
		BUFFER="cd ${selected_dir}"
		zle accept-line
	fi
	zle clear-screen
}

function fzft() {
	alias fzf='fzf-tmux -p 80%'
	export FZF_TMUX=1
	export FZF_TMUX_OPTS="-p 80%"
}


function grp() {
	local folder="${1:-.}"
	local code_flag="${2:-}"
	if [[ "$code_flag" == "--code" ]]; then
		rg --color=always --line-number --with-filename --field-match-separator ' ' . "$folder" | fzf --ansi --preview "bat -p --color=always {1} --highlight-line {2}" | awk '{print $1":"$2}' | xargs code --goto
	else
		rg --color=always --line-number --with-filename --field-match-separator ' ' . "$folder" | fzf --ansi --preview "bat -p --color=always {1} --highlight-line {2}" | awk '{print $1}'
	fi
}

zle -N move_ghq
bindkey '^]' move_ghq