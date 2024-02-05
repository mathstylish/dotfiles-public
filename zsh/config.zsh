unsetopt HIST_VERIFY # expansions like !$ works only pressing enter
stty stop undef		# Disable ctrl-s to freeze terminal.

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# zsh history-substring
bindkey "^K" history-substring-search-up
bindkey "^J" history-substring-search-down

