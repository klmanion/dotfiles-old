#!/usr/bin/env bash
#
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
ops="-Ffs"

no_backup=0

while [ $# -gt 0 ]; do
	case "$1" in
		(--copy)
			cmd="cp"
			ops="-r"
			;;

		(--no-backup)
			no_backup=1
			;;
		
		(--verbose)
			ops="$ops -v"
			;;
	esac
done

cd dotfiles
for src_base in *; do
	copy_suffix="~"

	dest_base=".$src_base"
	copy_base="$dest_base"

	src_prefix="$PWD"
	dest_prefix="$HOME"
	copy_prefix="$dest_prefix"

	src="$src_prefix/$src_base"
	dest="$dest_prefix/$dest_base"
	copy="$copy_prefix/$copy_base$copy_suffix"

	# backup user configuration
	if [ -e "$dest" ]; then
		if [ $no_backup -eq 0 ]; then
			while test -e "$copy"; do
				copy_base="$copy_base$copy_suffix"
				copy="$copy_prefix/$copy_base$copy_suffix"
			done
		fi

		mv -f "$dest" "$copy" || exit 1;
	fi

	eval $cmd $ops "$src" "$dest" || exit 1;

	chmod +x "$dest" || exit 1;
done

exit 0;

# vim: set ts=8 sw=8 noexpandtab tw=79:
