# Load and initialise completion system
# use lunarvim/neovim from vim if present
if [[ -x "$(command -v lvim)" ]]; then
	alias vim='lvim'
	alias vimdiff='lvim -d'
elif [[ -x "$(command -v nvim)" ]]; then
	alias vim='nvim'
	alias vimdiff='nvim -d'
fi

# if [[ -x "$(command -v bat)" ]]; then
#   alias cat='bat'
#   export MANPAGER="sh -c 'col -bx | bat -l man -p'"
#   alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
#   alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
# fi

# colorize commands when possible
alias \
	ls='ls -hN --color=auto --group-directories-first' \
	grep='grep --color=auto' \
	ip='ip -color=auto' \
	diff='diff --color=auto' \
	ll='ls -la'

# general
alias tmp='cd /tmp' \
	dws='cd ~/Development' \
	wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"' \
	ns='cd ~/.config/nvim' \
	za='vim ~/.config/zsh/aliases.zsh' \
	ze='vim ~/.config/zsh/.zshrc' \
	zr='source ~/.config/zsh/.zshrc' \
	cpf='cat $1 | xclip -sel clip' \
	se='vim ~/.config/starship.toml' \
	fzfp='fzf --preview "bat --color=always {}"' \
	rst='/usr/bin/xrdb -merge /home/stylish/.Xresources && kill -USR1 $(pidof st)' \

for command in mount unmount pacman updatedb shutdown poweroff reboot; do
	alias $command="sudo $command"
done; unset command