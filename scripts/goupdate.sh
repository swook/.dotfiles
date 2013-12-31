#!/bin/sh
cd $GOROOT/src
hg pull
hg update release
./make.bash
