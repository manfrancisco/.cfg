#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Environment variables
EDITOR=lvim

# Aliases

## Cargo
alias c="cargo"
alias cb="cargo build"
alias cbr="cargo build --release"
alias cr="cargo run"
alias crr="cargo run --release"
alias ct="cargo test"

## Git
alias g="git"
alias gs="git status -su"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit"
alias gca="git add -A && git commit"
alias gco="git checkout"
alias gst="git stash"
alias gd="git diff"
alias gds="git diff --stat"
alias gl="git log --oneline --graph"
alias gla="git log --oneline --graph --branches --remotes --tags HEAD"
alias gll="git log --graph"
alias gb="git branch"
alias gr="git reset"
alias grh="git reset --hard"
alias grhh="git reset --hard HEAD"
alias grah="git add -A && git reset --hard HEAD"

## Exa
if command -v exa &> /dev/null; then
    alias ls="exa --git -l"
    alias lsa="exa --git -al"
    alias lst="exa --git -lTL2"
    alias lsta="exa --git -laTL2"
else
    alias ls="ls -l"
    alias lsa="ls -la"
fi

## Other
alias e="lvim"
alias cls="clear; printf '\e[3J'"

# Functions

## Make a directory and move into it
function mcd() {
    if [ $# -ne 1 ]; then
        echo "Usage: mcd <dir>"
        return
    fi
    mkdir -p $1
    cd $1
}

# Path
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/scripts:$PATH"

# Fallback prompt if starship is not installed
PS1='[\u@\h \W]\$ '

# Starship
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

# Zoxide
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init bash --cmd j)"
fi
