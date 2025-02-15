if status is-interactive
    alias v='nvim'
    alias rmnotrash="/run/current-system/sw/bin/rm"
    alias rm='rmtrash'
    alias rmdir='rmdirtrash'
    alias ls='eza --time-style=long-iso --group-directories-first --icons --git -l'
    alias config="/usr/bin/env git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

    #Git stuff
    alias gs="git status"
    alias gaa="git add -A"
    alias gau="git add -u"
    alias gd="git diff"
    alias gc="git commit"
    alias co="git checkout"

end

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/opt/bin
fish_add_path $HOME/opt/zig
# fish_add_path $HOME/code/roc/target/release/
fish_add_path $HOME/code/roc/result/bin/
fish_add_path $HOME/go/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.dotnet/tools
fish_add_path $HOME/.nix-profile/bin
fish_add_path $HOME/.npm/bin

