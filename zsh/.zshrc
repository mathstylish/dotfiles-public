# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-history-substring-search"
plug "zsh-users/zsh-syntax-highlighting"
plug "junegunn/fzf-git.sh"

# local imports
plug "$ZDOTDIR/config.zsh"
plug "$ZDOTDIR/xdgbasedir.zsh"
plug "$ZDOTDIR/aliases.zsh"

# Load and initialise completion system
autoload -Uz compinit
compinit

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

[ -f ~/.local/bin/fzf.zsh ] && source ~/.local/bin/fzf.zsh
