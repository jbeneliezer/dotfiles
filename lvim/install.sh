#!/bin/bash

ln -sf "${PWD}/settings.lua" "$HOME/.local/share/lunarvim/lvim/lua/lvim/config/settings.lua"
cp "${PWD}/defaults.lua" "${PWD}/config.lua"
