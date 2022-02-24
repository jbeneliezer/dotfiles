--[[
lvim is the global options object Linters should be filled in as strings with either a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "tokyonight"
lvim.leader = "space"

-- keymappings [view all the defaults by pressing <leader>Lk]
-- unmap a default keymapping
-- lvim.keys.normal_mode["<c-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<c-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<c-q>"] = ":q<cr>"

-- Make Y behave like D and C
lvim.keys.normal_mode["Y"] = "y$"

-- Keep cursor centered
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"
lvim.keys.normal_mode["J"] = "mzJ`z"

-- Undo break points
lvim.keys.insert_mode[","] = ",<c-g>u"
lvim.keys.insert_mode["."] = ".<c-g>u"
lvim.keys.insert_mode["["] = "<c-g>u"
lvim.keys.insert_mode["!"] = "!<c-g>u"
lvim.keys.insert_mode["?"] = "?<c-g>u"

-- Moving text
lvim.keys.visual_mode["J"] = ":m '>+1<cr>gv=gv"
lvim.keys.visual_mode["K"] = ":m '<-2<cr>gv=gv"
lvim.keys.insert_mode["<c-j>"] = "<ESC>:m .+1<cr>a"
lvim.keys.insert_mode["<c-k>"] = "<ESC>:m .-2<cr>a"

-- Paste in visual mode
lvim.keys.visual_mode["<c-p>"] = '"_dP'

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
	-- for input mode
	i = {
		["<c-j>"] = actions.move_selection_next,
		["<c-k>"] = actions.move_selection_previous,
		["<c-n>"] = actions.cycle_history_next,
		["<c-p>"] = actions.cycle_history_prev,
	},
	-- for normal mode
	n = {
		["<c-j>"] = actions.move_selection_next,
		["<c-k>"] = actions.move_selection_previous,
	},
}

-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<cr>", "Projects" }
-- Use which-key to add extra bindings with the leader-key prefix

lvim.builtin.which_key.vmappings["/"] = { "<ESC><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>", "Comment" }
lvim.builtin.which_key.vmappings["j"] = { ":m '>+1<cr>gv=gv", "Move Down" }
lvim.builtin.which_key.vmappings["k"] = { ":m '>-2<cr>gv=gv", "Move Up" }

lvim.builtin.which_key.mappings[";"] = { "<cmd>Dashboard<cr>", "Dashboard" }
lvim.builtin.which_key.mappings["/"] = { "<cmd>lua require('Comment.api').toggle_current_linewise()<cr>", "Comment" }
lvim.builtin.which_key.mappings["w"] = { "<cmd>w<cr>", "Save" }
lvim.builtin.which_key.mappings["q"] = { "<cmd>q<cr>", "Quit" }
lvim.builtin.which_key.mappings["x"] = { "<cmd>x<cr>", "Save and Quit" }
lvim.builtin.which_key.mappings["!"] = { "<cmd>q!<cr>", "Force Quit" }
lvim.builtin.which_key.mappings["c"] = { "<cmd>bd!<cr>", "Close Buffer" }
lvim.builtin.which_key.mappings["n"] = { "<cmd>ene ", "New File" }
lvim.builtin.which_key.mappings["s"] = { ":w ", "Save as" }
lvim.builtin.which_key.mappings["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" }
lvim.builtin.which_key.mappings["o"] = { "<c-w>o", "Fullscreen" }
lvim.builtin.which_key.mappings["j"] = { "<cmd>m .+1<cr>", "which_key_ignore" }
lvim.builtin.which_key.mappings["a"] = { "G=gg2<c-o>zz", "Style" }
lvim.builtin.which_key.mappings["k"] = { "<cmd>m .-2<cr>", "which_key_ignore" }
lvim.builtin.which_key.mappings["<leader>"] = { "hl", "which_key_ignore" }
lvim.builtin.which_key.mappings["f"] = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		g = { "<cmd>Telescope live_grep<cr>", "Text" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		p = { "<cmd>Telescope projects<cr>", "Projects" },
		r = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		c = { "<cmd>Telescope commands<cr>", "Commands" },
		j = {
			"<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
			"Colorscheme with Preview",
		},
	}
lvim.builtin.which_key.mappings["t"] = {
		name = "Trouble",
		r = { "<cmd>Trouble lsp_references<cr>", "References" },
		f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
		d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
		q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
		l = { "<cmd>Trouble loclist<cr>", "LocationList" },
		w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
	}
lvim.builtin.which_key.mappings["h"] = {
		name = "Harpoon",
		h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Menu"},
		a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add" },
	}
lvim.builtin.which_key.mappings["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "which_key_ignore" }
lvim.builtin.which_key.mappings["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "which_key_ignore" }
lvim.builtin.which_key.mappings["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "which_key_ignore" }
lvim.builtin.which_key.mappings["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "which_key_ignore" }
lvim.builtin.which_key.mappings["5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "which_key_ignore" }
lvim.builtin.which_key.mappings["6"] = { "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", "which_key_ignore" }
lvim.builtin.which_key.mappings["7"] = { "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", "which_key_ignore" }
lvim.builtin.which_key.mappings["8"] = { "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", "which_key_ignore" }
lvim.builtin.which_key.mappings["9"] = { "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", "which_key_ignore" }
lvim.builtin.which_key.mappings["0"] = { "<cmd>lua require('harpoon.ui').nav_file(10)<cr>", "which_key_ignore" }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.quit_on_open = 1
lvim.builtin.nvimtree.show_icons.git = 0
-- lvim.builtin.nvimtree.hijack_netrw = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"cpp",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"html",
	"css",
	"rust",
	"java",
	"markdown",
}

lvim.builtin.treesitter.highlight.enabled = true
-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
-- { command = "black", filetypes = { "python" } },
-- { command = "isort", filetypes = { "python" } },
-- {
-- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
-- command = "prettier",
---@usage arguments to pass to the formatter
-- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
-- extra_args = { "--print-with", "100" },
---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
-- filetypes = { "typescript", "typescriptreact" },
-- },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
	-- Themes
	{"folke/tokyonight.nvim"},
	{'morhetz/gruvbox'},
	{'tomasr/molokai'},
	{'sainnhe/sonokai'},
	{'sainnhe/everforest'},
	{'jnurmine/Zenburn'},
	{'jacoborus/tender.vim'},
	{'mhartington/oceanic-next'},
	{'AlessandroYorba/Alduin'},
	{'savq/melange'},
	{'fcpg/vim-farout'},
	{'Mangeshrex/uwu.vim'},
	{'Mofiqul/dracula.nvim'},
	{'bluz71/vim-nightfly-guicolors'},
	{'EdenEast/nightfox.nvim'},

	-- Other
	{'ThePrimeagen/harpoon'},
	{
		"folke/trouble.nvim"
		-- cmd = "TroubleToggle",
	},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
-- { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- { "BufWinEnter", "*.lua", ":normal G=gg" },
-- }


