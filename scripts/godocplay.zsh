#!/bin/zsh

source $HOME/.zshrc

# Run godoc
godoc -http=:6060&

# Run goplay
cd $GOROOT/misc/goplay/
go build
./goplay&
