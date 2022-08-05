
vim.g.nvim_profile_path = [[/home/jb/.config/nvim/]]
vim.opt.runtimepath:append(vim.g.nvim_profile_path)
vim.opt.packpath = vim.g.nvim_profile_path

local packer_start_path = vim.g.nvim_profile_path .. "pack/packer/start"
local hotpot_path = packer_start_path .. "/hotpot.nvim"
local packer_path = packer_start_path .. "/packer.nvim"

if (vim.fn.empty(vim.fn.glob(hotpot_path))) > 0 then
    print("Cloning hotpot and packer into " .. packer_start_path)
    vim.fn.system({'mkdir', '-p', packer_start_path})
    vim.fn.system({'git', 'clone', 'https://github.com/rktjmp/hotpot.nvim', hotpot_path})
    vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', packer_path})
end

vim.cmd [[ packadd packer.nvim ]]
vim.cmd [[ packadd hotpot.nvim ]]

local packer = require('packer')
packer.init({
    package_root = vim.g.nvim_profile_path .. "pack/",
    compile_path = vim.g.nvim_profile_path .. "lua/packer_compiled.lua"
    })

require("hotpot")
require("jb.settings")

vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<Leader>e", ":Lexplore<cr>", { noremap = true })
