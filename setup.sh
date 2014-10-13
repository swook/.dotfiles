#!/bin/bash

##################################################
# Setup script for .dotfiles repository
#
# Author: Seon-Wook Park <seon.wook@swook.net>
# Date:   7th October 2014
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

# Create backups/ directory if not exists
BKPDIR=./backups/
if [ ! -d $BKPDIR ]; then
	mkdir $BKPDIR
fi

# For every non-ignored file in this folder
while read -r f; do
	sourcef=$(realpath -s "$(pwd)/$f")
	targetf=$(realpath -s "$HOME/$f")

	# Check if target is already symlink to source
	cursourcef=$(readlink -f "$targetf")
	if [ -h "$targetf" ] & [ "$cursourcef" = "$sourcef" ]; then
		continue
	fi

	# Create backup dir as necessary
	bkppath=$BKPDIR${f%/*}
	if [ ! -d $bkppath ]; then
		mkdir -p "$bkppath"
		echo $bkppath
	fi

	# Move existing file to backups/
	mv "$targetf" "$bkppath"

	# Create symlink to current .dotfiles folder
	ln -s "$sourcef" "$targetf"
	echo "$sourcef > $targetf"

done <<< "$(eval "find . ! -type d $IGNORESTR")"

