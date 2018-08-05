#!/usr/bin/env bash
#restore.sh

# restores user's prior configuration

if [ ! -d dotfiles ]; then
	printf '%s%s\n'
		'this script must be run in the top level directory of the' \
		'dotfiles repository' >&2
	exit 1;
fi

if [ $(id -u) -ne 0 ]; then
	printf 'this script must be run as root\n' >&2
	exec sudo "$0" $*
fi

# check to see if installer has run
cd dotfiles
for f in *; do
	if [ ! -e "$HOME/.$f~" ]; then
		printf '%s\n' 'missing a backup file'
		printf '%s%s\n' \
			'if you are sure the installer was run type yes ' \
			'to continue'
		read yesno
		if [[ ${yesno:0:1} == 'y' || ${yesno:0:1} == 'Y' ]]; then
			break
		else
			exit 1;
		fi
	fi
done

for f in *; do
	bkup="$HOME/.$f~"

	if [ -e "$bkup" ]; then
		rm -f "${bkup%"~"}"
		mv -f "$bkup" "${bkup%"~"}"
		test $? -ne 0 && exit 1;
	fi
done

exit 0;

# vim: set ts=8 sw=8 noexpandtab tw=79:
