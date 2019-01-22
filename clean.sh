#!/usr/bin/env bash
#clean.sh

# clean away any backed-up dotfiles in the home directory
# intended only for use by me in customizing a new system

if [ ! -d dotfiles ]; then
	printf '%s%s\n' \
		'this script must be run in the top level directory of the' \
		'dotfiles repository' >&2
	exit 1; 
fi

if [ $(id -u) -ne 0 ]; then
	printf 'this script must be run as root\n' >&2
	exec sudo "$0" $*
fi

cd dotfiles
for f in *; do
	bkup="$HOME/.$f~"

	if [ -e "$bkup" ]; then
		eval rm -fR "$bkup"*
	fi
done

exit 0;

# vim: set ts=8 sw=8 noexpandtab tw=79:
