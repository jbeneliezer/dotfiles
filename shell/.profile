# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# set PATH so it includes user's private config bin if it exists
[ -d "$HOME/.config/bin" ] && PATH="$HOME/.config/bin:$PATH"

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# set PATH so it includes user's cargo bin if it exists
[ -d "$HOME/.cargo/bin" ] && PATH="$HOME/.cargo/bin:$PATH"

# set PATH so it includes user's npm bin if it exists
[ -d "$HOME/.npm-global/bin" ] && PATH="$HOME/.npm-global/bin:$PATH"

BROWSER=chromium
EDITOR=nvim
# "$HOME/.cargo/env"

XDG_CONFIG_HOME=$HOME/.config
XDG_DATA_HOME=$HOME/.local/share
XDG_STATE_HOME=$HOME/.local/state
XDG_CACHE_HOME=$HOME/.cache
ZDOTDIR=$XDG_CONFIG_HOME/zsh
LESSHISTFILE=-
REPOS=~/repos
STARSHIP_CONFIG=~/.config/starship/starship.toml

. "$HOME/.cargo/env"
