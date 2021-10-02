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
verbose_flg=""

while [ $# -gt 0 ]; do
	case "$1" in
		(--copy)
			cmd="cp"
			ops="-r"
			;;

		(--dest-dir=*)
			dest_prefix="${1#*=}"
			;;

		(--no-backup)
			no_backup=1
			;;
		
		(--verbose)
			verbose_flg="-v"
			;;
		(*)
			printf '%s: %s\n' "unrecognized option" "$1"
			;;
	esac

	shift
done

ops="$ops $verbose_flg"

install()
{
	if [ ! -d "$dest_prefix" ]; then
		mkdir -p "$dest_prefix"
	fi

	for src_base in *; do
		if [ x$src_base = x"config" ]; then
			continue
		fi

		dest_base="$dest_lead$src_base"
		copy_base="$dest_base"

		src="$src_prefix/$src_base"
		dest="$dest_prefix/$dest_base"
		copy="$copy_prefix/$copy_base$copy_suffix"

		# backup user configuration
		if [ $no_backup -eq 0 ]; then
			if [ -e "$dest" ]; then
				# do not overwrite existing copies
				while test -e "$copy"; do
					copy_base="$copy_base$copy_suffix"
					copy="$copy_prefix/$copy_base$copy_suffix"
				done

				eval "mv -f $verbose_flg \"$dest\" \"$copy\"" || exit 1;
			fi
		fi

		if [ -d "$dest" ]; then
			rm -rf "$dest"
		fi

		eval "$cmd $ops \"$src\" \"$dest\"" || exit 1;

		chmod +x "$dest" || exit 1;
	done
}

cd dotfiles

src_prefix="$PWD"
: ${dest_prefix:="$HOME"}
dest_lead="."
copy_prefix="$dest_prefix"
copy_suffix="~"

install

cd config

src_prefix="$PWD"
dest_prefix="$dest_prefix/.config"
dest_lead=""
copy_prefix="$dest_prefix"
copy_suffix="~"

install

exit 0;

# vi: set ts=8 sw=8 noexpandtab tw=79:
