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
-- lvim.keys.normal_mode["<c-s>"] = ":w<cr>"
-- unmap a default keymapping
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

lvim.builtin.which_key.vmappings = {
	["/"] = { "<ESC><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>", "Comment" },
	["j"] = { ":m '>+1<cr>gv=gv", "Move Down" },
	["k"] = { ":m '>-2<cr>gv=gv", "Move Up" },
}

lvim.builtin.which_key.mappings = {
	[";"] = { "<cmd>Dashboard<cr>", "Dashboard" },
	["/"] = { "<cmd>lua require('Comment.api').toggle_current_linewise()<cr>", "Comment" },
	["w"] = { "<cmd>w<cr>", "Save" },
	["q"] = { "<cmd>q<cr>", "Quit" },
	["x"] = { "<cmd>x<cr>", "Save and Quit" },
	["!"] = { "<cmd>q!<cr>", "Force Quit" },
	["c"] = { "<cmd>BufferClose!<cr>", "Close Buffer" },
	["s"] = { ":w ", "Save as" },
	["n"] = { "<cmd>ene ", "New File" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["o"] = { "<c-w>o", "Fullscreen" },
	["a"] = { "G=gg2<c-o>zz", "Style" },
	["j"] = { "<cmd>m .+1<cr>", "which_key_ignore" },
	["k"] = { "<cmd>m .-2<cr>", "which_key_ignore" },
	["<leader>"] = { "hl", "which_key_ignore" },
	b = {
		name = "Buffers",
		j = { "<cmd>BufferPick<cr>", "Jump" },
		f = { "<cmd>Telescope buffers<cr>", "Find" },
		b = { "<cmd>b#<cr>", "Previous" },
		w = { "<cmd>BufferWipeout<cr>", "Wipeout" },
		e = {
			"<cmd>BufferCloseAllButCurrent<cr>",
			"Close all but current",
		},
		h = { "<cmd>BufferCloseBuffersLeft<cr>", "Close all to the left" },
		l = {
			"<cmd>BufferCloseBuffersRight<cr>",
			"Close all to the right",
		},
		D = {
			"<cmd>BufferOrderByDirectory<cr>",
			"Sort by directory",
		},
		L = {
			"<cmd>BufferOrderByLanguage<cr>",
			"Sort by language",
		},
	},
	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		r = { "<cmd>lua require('lvim.plugin-loader').recompile()<cr>", "Re-compile" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},
	g = {
		name = "Git",
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		C = {
			"<cmd>Telescope git_bcommits<cr>",
			"Checkout commit(for current file)",
		},
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Git Diff",
		},
	},
	l = {
		name = "LSP",
		a = { "<cmd>lua require('lvim.core.telescope').code_actions()<cr>", "Code Action" },
		d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
		w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {
			"<cmd>lua vim.diagnostic.goto_next()<cr>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.diagnostic.goto_prev()<cr>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		p = {
			name = "Peek",
			d = { "<cmd>lua require('lvim.lsp.peek').Peek('definition')<cr>", "Definition" },
			t = { "<cmd>lua require('lvim.lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
			i = { "<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>", "Implementation" },
		},
		q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},
	L = {
		name = "LunarVim",
		c = {
			"<cmd>edit " .. get_config_dir() .. "/config.lua<cr>",
			"Edit config.lua",
		},
		f = {
			"<cmd>lua require('lvim.core.telescope.custom-finders').find_lunarvim_files()<cr>",
			"Find LunarVim files",
		},
		g = {
			"<cmd>lua require('lvim.core.telescope.custom-finders').grep_lunarvim_files()<cr>",
			"Grep LunarVim files",
		},
		k = { "<cmd>Telescope keymaps<cr>", "View LunarVim's keymappings" },
		i = {
			"<cmd>lua require('lvim.core.info').toggle_popup(vim.bo.filetype)<cr>",
			"Toggle LunarVim Info",
		},
		I = {
			"<cmd>lua require('lvim.core.telescope.custom-finders').view_lunarvim_changelog()<cr>",
			"View LunarVim's changelog",
		},
		l = {
			name = "logs",
			d = {
				"<cmd>lua require('lvim.core.terminal').toggle_log_view(require('lvim.core.log').get_path())<cr>",
				"view default log",
			},
			D = {
				"<cmd>lua vim.fn.execute('edit ' .. require('lvim.core.log').get_path())<cr>",
				"Open the default logfile",
			},
			l = {
				"<cmd>lua require('lvim.core.terminal').toggle_log_view(vim.lsp.get_log_path())<cr>",
				"view lsp log",
			},
			L = { "<cmd>lua vim.fn.execute('edit ' .. vim.lsp.get_log_path())<cr>", "Open the LSP logfile" },
			n = {
				"<cmd>lua require('lvim.core.terminal').toggle_log_view(os.getenv('NVIM_LOG_FILE'))<cr>",
				"view neovim log",
			},
			N = { "<cmd>edit $NVIM_LOG_FILE<cr>", "Open the Neovim logfile" },
			p = {
				"<cmd>lua require('lvim.core.terminal').toggle_log_view('packer.nvim')<cr>",
				"view packer log",
			},
			P = { "<cmd>exe 'edit '.stdpath('cache').'/packer.nvim.log'<cr>", "Open the Packer logfile" },
		},
		r = { "<cmd>LvimReload<cr>", "Reload LunarVim's configuration" },
		u = { "<cmd>LvimUpdate<cr>", "Update LunarVim" },
	},
	f = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
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
	},
	T = {
		name = "Treesitter",
		i = { ":TSConfigInfo<cr>", "Info" },
	},
	t = {
		name = "Trouble",
		r = { "<cmd>Trouble lsp_references<cr>", "References" },
		f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
		d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
		q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
		l = { "<cmd>Trouble loclist<cr>", "LocationList" },
		w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
	},
	h = {
		name = "Harpoon",
		h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Menu"},
		a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add" },
	},
	["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "which_key_ignore" },
	["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "which_key_ignore" },
	["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "which_key_ignore" },
	["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "which_key_ignore" },
	["5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "which_key_ignore" },
	["6"] = { "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", "which_key_ignore" },
	["7"] = { "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", "which_key_ignore" },
	["8"] = { "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", "which_key_ignore" },
	["9"] = { "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", "which_key_ignore" },
	["0"] = { "<cmd>lua require('harpoon.ui').nav_file(10)<cr>", "which_key_ignore" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.quit_on_open = 1
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
}

lvim.builtin.treesitter.highlight.enabled = true

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
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{'norcalli/nvim-colorizer.lua'},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
-- { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- { "BufWinEnter", "*.lua", ":normal G=gg" },
-- }


