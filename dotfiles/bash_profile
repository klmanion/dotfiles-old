#.bash_profile

[ -r "$HOME/.profile" ] && . "$HOME/.profile"

if [ -x "/Applications/Racket/share/pkgs/shell-completion/racket-completion.bash" ]; then
	source "/Applications/Racket/share/pkgs/shell-completion/racket-completion.bash"
fi

if [ -e "${HOME}/.iterm2_shell_integration.bash" ]; then
	source "${HOME}/.iterm2_shell_integration.bash"
fi

if [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
	source "/usr/local/etc/profile.d/bash_completion.sh"
fi

shopt -s dotglob extglob

[ -r "$HOME/.bashrc" ] && . "$HOME/.bashrc"

