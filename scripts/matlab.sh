#!/bin/bash

mPath=$HOME/matlab

export XAPPLRESDIR=$mPath/X11/app-defaults
export PATH=$HOME/bin:$PATH

$mPath/bin/matlab -nosplash $@
