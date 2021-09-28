# .zsh_profile

[ -r "$HOME/.profile" ] && . "$HOME/.profile"

#fpath=(/usr/local/share/zsh-completions $fpath)

#export PS1="%# "

if [ -r "$HOME/.iterm2_shell_integration.zsh" ]; then
	source "$HOME/.iterm2_shell_integration.zsh"
#	PS1=%{$(iterm2_prompt_mark)%}$PS1
fi

if [ -r "/Applications/Racket/share/pkgs/shell-completion/racket-completion.zsh" ]; then
	source "/Applications/Racket/share/pkgs/shell-completion/racket-completion.zsh" 
fi

bindkey -v
export KEYTIMEOUT=1

setopt AUTO_CD
setopt BASH_AUTO_LIST
setopt COMPLETE_IN_WORD
setopt LIST_PACKED
setopt ZLE

#if [ -r "$HOME/.zshrc" ]; then
#	. "$HOME/.zshrc"
#fi
