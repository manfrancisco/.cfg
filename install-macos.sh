#!/usr/bin/env bash

if ! command -v stow &> /dev/null; then
    echo "stow not installed"
    exit 1
fi

stow fish
stow git
stow kitty-macos
stow lvim
stow nushell
stow nvim
stow omp
stow tmux
stow vim
stow vscode
stow zsh
