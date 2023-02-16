if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting ""
    
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
