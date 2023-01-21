#===--------------------------------------------------------------------------------------------===#
#=== Oh-My-Zsh configuration (user settings are further down - do not set them here)
#===--------------------------------------------------------------------------------------------===#

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set theme
ZSH_THEME="robbyrussell"

plugins=(rust gitfast)

source $ZSH/oh-my-zsh.sh

#===--------------------------------------------------------------------------------------------===#
#=== User configuration
#===--------------------------------------------------------------------------------------------===#

# How many lines of history to keep in memory
HISTSIZE=10000
# How many lines to keep in the history file
SAVEHIST=1000000000

# Get rid of all the aliases OMZ adds
unalias -m '*'

# Import abbreviation plugin
source $HOME/.config/zsh/abbr.zsh

# Abbreviations

## Git
abbr g="git"
abbr gs="git status -su"
abbr ga="git add"
abbr gaa="git add -A"
abbr gc="git commit"
abbr gca="git add -A && git commit"
abbr gco="git checkout"
abbr gst="git stash"
abbr gd="git diff"
abbr gds="git diff --stat"
abbr gl="git log --oneline --graph"
abbr gla="git log --oneline --graph --branches --remotes --tags HEAD"
abbr gll="git log --graph"
abbr gb="git branch"
abbr gr="git reset"
abbr grh="git reset --hard"
abbr grhh="git reset --hard HEAD"
abbr grah="git add -A && git reset --hard HEAD"

## Cargo
abbr c='cargo'
abbr cb='cargo build'
abbr cbr='cargo build --release'
abbr cr='cargo run'
abbr crr='cargo run --release'
abbr ct='cargo test'

## Exa
if command -v exa &> /dev/null; then
    abbr ls="exa --git -l"
    abbr lsa="exa --git -al"
    abbr lst="exa --git -lTL2"
    abbr lsta="exa --git -laTL2"
else
    abbr ls="ls -l"
    abbr lsa="ls -la"
fi

## Tmux
abbr ta="tmux new -As"

## Other
abbr e="nvim"
abbr cls="clear; printf '\e[3J'"

# Functions

# Make a directory and cd into it
mcd()
{
    test -d "$1" || mkdir -p "$1" && cd "$1"
}

export LANG=en_US.UTF-8

# Disable bell
unsetopt BEEP

# Set default editor
export VISUAL='lvim'
export EDITOR='lvim'

# Set terminal color mode
export TERM='xterm-256color'

# Load platform specific rc files
if [[ -e "$HOME/.zshrc.macos" ]]; then
    source "$HOME/.zshrc.macos"
fi

if [[ -e "$HOME/.zshrc.linux" ]]; then
    source "$HOME/.zshrc.linux"
fi

# Load local rc
if [[ -e "$HOME/.zshrc.local" ]]; then
    source "$HOME/.zshrc.local"
fi

# Rust/Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# Custom scripts
export PATH="$HOME/scripts:$PATH"

# Local executables
export PATH="$HOME/.local/bin:$PATH"

if command -v pyenv &> /dev/null; then
    eval "$(pyenv init -)"
    export PATH="$HOME/.pyenv/bin:$PATH"
fi

# rbenv
if command -v rbenv &> /dev/null; then
    eval "$(rbenv init -)"
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Starship
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# Zoxide
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh --cmd j)"
fi
