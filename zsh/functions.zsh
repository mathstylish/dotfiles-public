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
