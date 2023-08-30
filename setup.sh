#!/usr/bin/env bash
cd "$(dirname "$0")"
stow -t $HOME -vv .

git submodule update --init --recursive