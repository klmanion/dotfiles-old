#!/usr/bin/env bash
#install.sh

# Installs the dotfiles in the directory dotfiles into the home directory.
# Default behavior is to symlink them, but this can be overriden by a 
# --copy option.

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

cmd="ln"
ops="-s"

while [ $# -gt 0 ]; do
	case "$1" in
		(--copy)
			cmd="cp"
			ops="-r"
			;;
		
		(--verbose)
			ops="$ops -v"
			;;
	esac
done

cd dotfiles
for src in *; do
	dest="$HOME/.$src"

	# backup user configuration
	test -e "$dest" && mv "$dest" "$dest~"

	$cmd $ops "$src" "$dest"
	test $? -ne 0 && exit 1;

	chmod +x "$dest"
	test $? -ne 0 && exit 1;
done

exit 0;

# vim: set ts=8 sw=8 noexpandtab tw=79:
