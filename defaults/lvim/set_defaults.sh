CFDIR=$HOME/.config/lvim
SDIR=$HOME/.local/share/lunarvim/lvim/lua/lvim/config
CDIR=$HOME/.config/defaults/lvim

find "${CFDIR}" -name "config.lua" -exec rm {} \;
ln -s "${CDIR}/config.lua" "${CFDIR}/config.lua"

find "${SDIR}" -name "settings.lua" -exec rm {} \;
ln -s "${CDIR}/settings.lua" "${SDIR}/settings.lua"
