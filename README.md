# dotfiles
These are the up-to-date dotfiles of Kurt L. Manion.
Dotfiles are the basic customization mechanic used by UNIX systems.
They are text files housed in the home directory that hold preferences for
their associated applications.

## Try them out
The install script saves your old dot files,
and they can be restored with the restore script.

By default the install script creates hard links of the files in this
repository in your home directory.
If you would like to keep and customize these dotfiles pass the installer the
`--copy` option, and it will copy them using `cp` instead of linking them with `ln`.
This sets the method for all the files, so the more graceful solution,
should one not desire all the dotfiles be copied,
is to handpick the ones desired and copy them by hand.

