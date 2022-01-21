#!/bin/bash

HERE=$XDG_CONFIG_HOME/defaults/lvim

ln -sf "${HERE}/config.lua" "$XDG_CONFIG_HOME/lvim/config.lua"
ln -sf "${HERE}/settings.lua" "$HOME/.local/share/lunarvim/lvim/lua/lvim/config/settings.lua"
