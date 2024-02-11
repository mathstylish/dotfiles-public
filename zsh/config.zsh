unsetopt HIST_VERIFY # expansions like !$ works only by pressing enter
stty stop undef		# Disable ctrl-s to freeze terminal.

# zsh history-substring
bindkey "^K" history-substring-search-up
bindkey "^J" history-substring-search-down

