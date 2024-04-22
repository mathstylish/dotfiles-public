function gc() {
    user=$2
    repo=$3
    if [[ "$1" == "ssh" ]]; then
	git clone "git@github.com:${user}/${repo}"
    elif [[ "$1" == "https" ]]; then
	git clone "https://github.com/${user}/${repo}"
    else
        echo "Usage: gc <http or ssh> repository"
    fi
}

function start_ssh_agent() {
  # Iniciar o ssh-agent se não estiver em execução
  if [ -z "$SSH_AUTH_SOCK" ] || ! ssh-add -l &>/dev/null; then
      eval "$(ssh-agent -s)" >/dev/null 2>&1
  fi

  # Adicionar todas as chaves SSH encontradas no diretório ~/.ssh
  for keyfile in ~/.ssh/*.pub; do
      key="${keyfile%.pub}"
      if [ -f "$key" ]; then
          ssh-add "$key" >/dev/null 2>&1
      fi
  done
}
