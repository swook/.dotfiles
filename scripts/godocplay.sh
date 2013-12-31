#!/bin/bash

source $HOME/.zshrc

# Run godoc
cd $HOME/src/go.tools/cmd/godoc
go build
godoc -http=:6060&

# Run goplay
cd $GOROOT/misc/goplay/
go build
goplay&
