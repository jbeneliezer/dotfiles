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

keymap("n", "<leader>w", "<cmd>w<cr>", opts)
keymap("n", "<leader>q", "<cmd>q<cr>", opts)
keymap("n", "<leader>x", "<cmd>x<cr>", opts)
keymap("n", "<leader>a", "G=gg2<c-o>zz", opts)

-- Better window navigation
keymap("n", "<c-h>", "<c-w>h", opts)
keymap("n", "<c-j>", "<c-w>j", opts)
keymap("n", "<c-k>", "<c-w>k", opts)
keymap("n", "<c-l>", "<c-w>l", opts)
keymap("n", "<leader>o", "<c-w>o", opts)

-- Resize with arrows
keymap("n", "<c-Up>", "<cmd>resize -2<cr>", opts)
keymap("n", "<c-Down>", "<cmd>resize +2<cr>", opts)
keymap("n", "<c-Left>", "<cmd>vertical resize -2<cr>", opts)
keymap("n", "<c-Right>", "<cmd>vertical resize +2<cr>", opts)

-- Navigate buffers
keymap("n", "<s-l>", "<cmd>bnext<cr>", opts)
keymap("n", "<s-h>", "<cmd>bprevious<cr>", opts)
keymap("n", "<leader>c", "<cmd>Bdelete!<cr>", opts)

-- Move text up and down
keymap("n", "<leader>j", "<Esc><cmd>m .+1<cr>==", opts)
keymap("n", "<leader>k", "<Esc><cmd>m .-2<cr>==", opts)
keymap("v", "<a-j>", "<cmd>m .+1<cr>==", opts)
keymap("v", "<a-k>", "<cmd>m .-2<cr>==", opts)
keymap("v", "p", '"_dP', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("x", "J", "<cmd>move '>+1<cr>gv-gv", opts)
keymap("x", "K", "<cmd>move '<-2<cr>gv-gv", opts)
keymap("x", "<a-j>", "<cmd>move '>+1<cr>gv-gv", opts)
keymap("x", "<a-k>", "<cmd>move '<-2<cr>gv-gv", opts)

-- Better terminal navigation
-- keymap("t", "<c-h>", "<c-\\><c-n><c-w>h", term_opts)
-- keymap("t", "<c-j>", "<c-\\><c-n><c-w>j", term_opts)
-- keymap("t", "<c-k>", "<c-\\><c-n><c-w>k", term_opts)
-- keymap("t", "<c-l>", "<c-\\><c-n><c-w>l", term_opts)

-- Nvimtree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)

-- Toggleterm
keymap("n", "<c-t>", "<cmd>ToggleTerm<cr>", opts)
keymap("t", "<c-t>", "<cmd>ToggleTerm<cr>", opts)
