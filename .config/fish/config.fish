if status is-interactive
    # Commands to run in interactive sessions can go here
    
    # if not set -q ZELLIJ
    #     if test -z $(zellij ls)
    #         zellij
    #     end
    # end
    eval (zellij setup --generate-auto-start fish | string collect)
    # aliases

    alias v='nvim'
    alias rmnotrash="/run/current-system/sw/bin/rm"
    alias rm='rmtrash'
    alias rmdir='rmdirtrash'
    alias ls='eza --time-style=long-iso --group-directories-first --icons --git -l'
    alias config="/usr/bin/env git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
    export EDITOR="nvim"
    # export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
    # set prompt to starship
    # starship init fish | source
    # load_nvm > /dev/stderr
end

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/opt/bin
fish_add_path $HOME/code/roc/result/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.dotnet/tools
fish_add_path $HOME/.nix-profile/bin

