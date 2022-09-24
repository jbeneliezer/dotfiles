# Basic Aliases
alias ls='ls --color=auto'
alias l='ls -F'
alias la='ls -aF'
alias ll='lsd -AlF --group-dirs first'
alias e='$EDITOR'
alias v='$EDITOR'
alias cf='cd $XDG_CONFIG_HOME'

# Tmux Aliases
# alias t='tmux new-session -s ${PWD##*/}'
alias tl='tmux list-sessions'
alias ta='tmux attach -t '
alias td='tmux detach'
alias tn='tmux new-session -s '
alias tr='tmux rename-session -t '
alias tk='tmux kill-session -t '
alias tka='tmux kill-server'

# Git Aliases
alias gcl='git clone '
alias gch='git checkout '
alias ga='git add '
alias gs='git status'
alias gc='git commit -m '
alias gp='git push'

# Alacritty themes
alias at='alacritty-themes'

# lf
alias lf='lfub'
