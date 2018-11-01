
Debian
====================
This directory contains files used to package npayd/npay-qt
for Debian-based Linux systems. If you compile npayd/npay-qt yourself, there are some useful files here.

## npay: URI support ##


npay-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install npay-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your npayqt binary to `/usr/bin`
and the `../../share/pixmaps/npay128.png` to `/usr/share/pixmaps`

npay-qt.protocol (KDE)

