# ~/.vim, ~/.vimrc, ~/viminfo
if ! [ -d "$XDG_DATA_HOME/vim" ]; then
  mkdir -p "$XDG_DATA_HOME"/vim/{undo,swap,backup}
fi
