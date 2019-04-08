#!/usr/bin/env bash

export CGO_ENABLED="0"
export GO111MODULE=on

set -x
rm -r packages
rm -r /usr/local/go/pkg/linux_amd64_dynlink/

# Works fine, output in "packages"
go install -pkgdir packages -buildmode=shared std

# Does not output anything, no errors
#go install -pkgdir packages -buildmode=shared -linkshared myLibrary/myLibrary.go

go build -pkgdir packages -buildmode=plugin -linkshared -o build/myPlugin.so myPlugin/myPlugin.go

go build -pkgdir packages -linkshared -o build/myApplication myApplication/myApplication.go
