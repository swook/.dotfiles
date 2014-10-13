#!/bin/bash

##################################################
# Restore script for .dotfiles repository
#
# Author: Seon-Wook Park <seon.wook@swook.net>
# Date:   14th October 2014
#
# NOTE: Scripts and configurations may assume
#       location of $(pwd) to be $HOME/.dotfiles
##################################################

# Files and folders to ignore during setup
IGNOREF=$(cat .setupignore)

# Ignore commented file/folders
IGNORESTR=""
while read -r f; do
	if [ "${#f}" -gt "0" -a "${f:0:1}" != "#" ]; then
		IGNORESTR+=" ! -path \"./$f\""
	fi
done <<< "$IGNOREF"

# Leave if backups/ directory does not exist
BKPDIR=./backups/
if [ ! -d $BKPDIR ]; then
	exit
fi

# For every non-ignored file in this folder
while read -r f; do
	sourcef=$(realpath -s "$(pwd)/$f")
	targetf=$(realpath -s "$HOME/$f")
	backupf=$(realpath -s "$BKPDIR$f")

	# Check if target is symlink to source
	cursourcef=$(readlink -f "$targetf")
	if [ -h "$targetf" ] & [ "$cursourcef" = "$sourcef" ]; then
		rm "$targetf"

		if [ -f "$backupf" ]; then
			cp "$backupf" "$targetf"
			echo "$backupf > $targetf"
		fi
	fi

done <<< "$(eval "find . ! -type d $IGNORESTR")"

