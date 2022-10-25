#!/usr/bin/env bash

if ! command -v stow &> /dev/null; then
    echo "stow not installed"
    exit 1
fi

stow fish
stow gestures
stow git
stow i3
stow kitty
stow lvim
stow nushell
stow nvim
stow omp
stow polybar
stow tmux
stow vim
stow vscode
stow xmodmap
stow zsh
