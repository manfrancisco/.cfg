# Declare a list of abbreviations
typeset -a abbreviations
abbreviations=()

# Create a new abbreviation
function abbr() {
    alias $1
    abbreviations+=(${1%%\=*})
}

# Expand abbreviations in the current line buffer
function expand-abbr() {
    if [[ $LBUFFER =~ "\<(${(j:|:)abbreviations})\$" ]]; then
        zle _expand_alias
        zle expand-word
    fi
    zle magic-space
}
zle -N expand-abbr

# Bind the space key to expand abbreviations
bindkey ' ' expand-abbr
# Bind ctrl+space to bypass expansion
bindkey '^ ' magic-space
# Don't expand abbreviations when searching
bindkey -M isearch " " magic-space

# Expand abbreviations when accepting the line
expand-abbr-and-accept-line() {
    expand-abbr
    zle .backward-delete-char
    zle .accept-line
}
zle -N expand-abbr-and-accept-line
