# Load and initialise completion system
# use neovim from vim if present
if [[ -x "$(command -v nvim)" ]]; then
	alias vim='nvim'
	alias vimdiff='nvim -d'
fi

if [[ -x "$(command -v bat)" ]]; then
  alias cat='bat'
fi

if pacman -Qs "bat-extras" > /dev/null; then
  alias man='batman'
fi

# colorize commands when possible
alias \
	ls='ls -hN --color=auto --group-directories-first' \
	grep='grep --color=auto' \
	ip='ip -color=auto' \
	diff='diff --color=auto' \
	ll='ls -la'

# general
alias dws='cd ~/Development' \
	wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"' \
	za='vim ~/.config/zsh/aliases.zsh' \
	ze='vim ~/.config/zsh/.zshrc' \
	zr='source ~/.config/zsh/.zshrc' \
	rst='/usr/bin/xrdb -load -I$HOME/dotfiles-public/Xresources.d ~/.Xresources && kill -USR1 $(pidof st)' \

for command in mount unmount pacman updatedb shutdown poweroff reboot; do
	alias $command="sudo $command"
done; unset command
