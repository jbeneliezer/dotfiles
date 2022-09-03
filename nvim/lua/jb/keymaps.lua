local opts = { noremap = true, silent = true }
--[[ local term_opts = { silent = true } ]]

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap("n", "*", "", opts)
keymap("v", "*", "", opts)

keymap("n", "<s-j>", "<c-d>zz", opts);
keymap("n", "<s-k>", "<c-u>zz", opts);

-- Better window navigation
keymap("n", "<c-h>", "<c-w>h", opts)
keymap("n", "<c-j>", "<c-w>j", opts)
keymap("n", "<c-k>", "<c-w>k", opts)
keymap("n", "<c-l>", "<c-w>l", opts)

-- Resize with arrows
keymap("n", "<c-Up>", "<cmd>resize -2<cr>", opts)
keymap("n", "<c-Down>", "<cmd>resize +2<cr>", opts)
keymap("n", "<c-Left>", "<cmd>vertical resize -2<cr>", opts)
keymap("n", "<c-Right>", "<cmd>vertical resize +2<cr>", opts)

-- Navigate buffers
keymap("n", "<s-l>", "<cmd>bnext<cr>", opts)
keymap("n", "<s-h>", "<cmd>bprevious<cr>", opts)
--[[ keymap("n", "<leader>c", "<cmd>Bdelete!<cr>", opts) ]]

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Paste in visual mode
keymap("v", "p", '"_dP', opts)

-- Toggleterm
keymap("n", "<c-t>", "<cmd>ToggleTerm<cr>", opts)
keymap("t", "<c-t>", "<cmd>ToggleTerm<cr>", opts)

-- Git
keymap("n", "<c-g>", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", opts)
