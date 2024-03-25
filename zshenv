export PATH="$HOME/.local/bin:$PATH"

export EDITOR=vim

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PATH="$XDG_DATA_HOME/npm/bin:$PATH"

export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export PATH="$CARGO_HOME/bin:$PATH"

# set this to make gpg works
export GPG_TTY=$(tty)

export JAVA_HOME="$HOME/.local/jvm/jdk-17.0.9"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$HOME/.local/share/maven/bin:$PATH"

export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

export FZF_DEFAULT_COMMAND="fd --type f"

export NVM_DIR="$XDG_DATA_HOME/nvm"

export VIMINIT="if has(\"nvim\") | so ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.vim | else | set nocp | so ${XDG_CONFIG_HOME:-$HOME/.config}/vim/vimrc | endif"

