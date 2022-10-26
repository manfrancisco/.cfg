if status is-interactive
    # Oh my posh
    # if type -q oh-my-posh
        # oh-my-posh init fish --config ~/.config/oh-my-posh/themes/gruvbox.toml | source
    # end

    # Environment Variables
    set -g EDITOR lvim
    ## Don't display a greeting when the shell starts
    set -g fish_greeting ""

    # Abbreviations

    ## Cargo
    abbr -ag c cargo
    abbr -ag cb cargo build
    abbr -ag cbr cargo build --release
    abbr -ag cr cargo run
    abbr -ag crr cargo run --release
    abbr -ag ct cargo test
    
    ## Git
    abbr -ag g git
    abbr -ag gs git status -su
    abbr -ag ga git add
    abbr -ag gaa git add -A
    abbr -ag gc git commit
    abbr -ag gca "git add -A && git commit"
    abbr -ag gco git checkout
    abbr -ag gst git stash
    abbr -ag gd git diff
    abbr -ag gds git diff --stat
    abbr -ag gl git log --oneline --graph
    abbr -ag gla git log --oneline --graph --branches --remotes --tags HEAD
    abbr -ag gll git log --graph
    abbr -ag gb git branch
    abbr -ag gr git reset
    abbr -ag grh git reset --hard
    abbr -ag grhh git reset --hard HEAD
    abbr -ag grah "git add -A && git reset --hard HEAD"

    ## Exa
    if type -q exa
        abbr -ag ls exa --git -l
        abbr -ag lsa exa --git -al
        abbr -ag lst exa --git -lTL2
        abbr -ag lsta exa --git -laTL2
    else
        abbr -ag ls ls -l
        abbr -ag lsa ls -la
    end

    ## Other
    abbr -ag e lvim
    abbr -ag cls "clear; printf '\e[3J'"

    # Functions

    ## Make a directory and move into it
    function mcd
        if test (count $argv) != 1
            echo "Usage: mcd <dir>"
            return
        end
        mkdir -p $argv
        cd $argv
    end

    ## Checkout next commit in the direction of the argument
    ## Note: only capable of moving forward in history, not backward
    ## Ex: `gmt master` would move one commit towards master
    function gmt
        if test (count $argv) != 1
            echo "Usage: gmt <commit|branch|tag>"
            return
        end
        git checkout $(git rev-list --topo-order HEAD..$argv | tail -1)
    end

    # LunarVim
    fish_add_path $HOME/.local/bin
    # Scripts
    fish_add_path $HOME/scripts
    # Cargo
    fish_add_path $HOME/cargo

    # Zoxide
    if type -q zoxide
        zoxide init fish --cmd j | source
    end
    
    # Starship
    if type -q starship
        starship init fish | source
    end
end

