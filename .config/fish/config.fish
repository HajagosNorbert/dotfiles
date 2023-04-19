# The following snippet is meant to be used like this in your fish config:
#
#     eval (zellij setup --generate-auto-start fish | string collect)

if status is-interactive
    # Commands to run in interactive sessions can go here
    
    set ZELLIJ_AUTO_ATTACH true
    if not set -q ZELLIJ
        if test "$ZELLIJ_AUTO_ATTACH" = "true"
            zellij attach -c
        else
            zellij
        end
    end
    # aliases

    alias v='nvim'
    alias rm='rmtrash'
    alias rmdir='rmdirtrash'
    alias ls='exa --time-style=long-iso --group-directories-first --icons --no-permissions --git --no-user -l'
    export EDITOR="~/.local/bin/lvim"
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
    # set prompt to starship
    starship init fish | source
    # load_nvm > /dev/stderr
end

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/opt/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.dotnet/tools
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
