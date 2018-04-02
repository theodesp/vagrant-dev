#!/usr/bin/env bash

sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt-get update
sudo apt-get install -y golang-1.10-go
cat << ENDL > /etc/profile.d/exports.sh
export GOROOT=/usr/lib/go-1.10
export GOPATH=~/go
export PATH=$PATH:$GOROOT/bin
ENDL
chmod +x /etc/profile.d/exports.sh
