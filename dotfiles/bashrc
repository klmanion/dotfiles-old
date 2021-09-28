#.bashrc

if [ -z "$PS1" ]; then
	return
fi

[ -r "$HOME/.rc" ] && . "$HOME/.rc"

[ -r "$HOME/bashrc_$TERM_PROGRAM" ] && . "$HOME/bashrc_$TERM_PROGRAM"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
