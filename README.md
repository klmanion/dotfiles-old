# dotfiles
These are the up-to-date dotfiles of Kurt L. Manion.
Dotfiles are the basic customization mechanic used by UNIX systems.
They are text files housed in the home directory that hold preferences for
their associated applications.

## Try them out
The install script saves your old dot files,
and they can be restored with the restore script.

By default the install script creates symbolic links of the files in this
repository in your home directory.
If you would like to keep and customize these dotfiles pass the installer the
`--copy` option, and it will copy them using `cp` instead of linking them with `ln -s`.
This sets the method for all the files, so the most graceful solution,
should one desire some but not all the dotfiles be copied,
is to install with the copy command then delete the backups before restoring.

# Archival Note
At one point I comitted the entire contents of cargo, or some such situation,
and since then have had to use --depth=1 on every pull, which,
in tandem with the fact that I just overhauled these
and am currently changing the management method from my custom scripts here to rcm,
has led me to archive this and start anew.
