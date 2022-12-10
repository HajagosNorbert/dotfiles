if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting ""
    
    # aliases
    function pls
	eval command sudo $history[1]
    end
    alias v='nvim'
    alias rm='rmtrash'
    alias rmdir='rmdirtrash'

    # autojump-fish enabled
    source /usr/share/autojump/autojump.fish

    export EDITOR="/usr/bin/nvim"
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
    # set prompt to starship
    starship init fish | source
end

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin
alias config='/usr/bin/git --git-dir=/home/ezredes02/.dotfiles/ --work-tree=/home/ezredes02'
