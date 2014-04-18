#!/bin/sh
cd $GOROOT/src
hg pull
hg update release
./make.bash

go install code.google.com/p/go.tools/cmd/godoc
go install code.google.com/p/go.tools/cmd/vet
