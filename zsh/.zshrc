#===--------------------------------------------------------------------------------------------===#
#=== Oh-My-Zsh configuration (user settings are further down - do not set them here)
#===--------------------------------------------------------------------------------------------===#

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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

# Aliases

## Cargo
alias c='cargo'
alias cb='cargo build'
alias cbr='cargo build --release'
alias cr='cargo run'
alias crr='cargo run --release'
alias ct='cargo test'

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

## Tmux
alias ta="tmux new -As"

## Other
alias e="lvim"
alias cls="clear; printf '\e[3J'"

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
