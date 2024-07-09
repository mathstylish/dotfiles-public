# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

source $HOME/.zshenv
export HISTFILE="$XDG_CONFIG_HOME/zsh/.zsh_history"
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

unsetopt HIST_VERIFY # expansions like !$ works only by pressing enter
stty stop undef		# Disable ctrl-s to freeze terminal.

# zsh history-substring
bindkey "^K" history-substring-search-up
bindkey "^J" history-substring-search-down

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-history-substring-search"
plug "zsh-users/zsh-syntax-highlighting"
plug "junegunn/fzf-git.sh"

# local imports
plug "$ZDOTDIR/config.zsh"
plug "$ZDOTDIR/aliases.zsh"
plug "$ZDOTDIR/functions.zsh"

# Load and initialise completion system
autoload -Uz compinit
compinit

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
start_ssh_agent

# nvm
source /usr/share/nvm/init-nvm.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$XDG_DATA_HOME/sdkman"
[[ -s "/home/stylish/.local/share/sdkman/bin/sdkman-init.sh" ]] && source "/home/stylish/.local/share/sdkman/bin/sdkman-init.sh"
