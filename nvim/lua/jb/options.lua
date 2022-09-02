local options = {
	backup = false,
	cmdheight = 2,
	completeopt = { "menuone", "noselect" },
	conceallevel = 0,
	colorcolumn = "80",
	fileencoding = "utf-8",
	incsearch = true,
	hlsearch = false,
	ignorecase = true,
	mouse = "a",
	pumheight = 10,
	showmode = false,
	showtabline = 2,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	termguicolors = true,
	timeoutlen = 0,
	undodir = vim.fn.stdpath("config") .. "/.undo",
	undofile = true,
	updatetime = 300,
	writebackup = false,
	expandtab = false,
	shiftwidth = 4,
	tabstop = 4,
	cursorline = true,
	cursorcolumn = true,
	number = true,
	relativenumber = true,
	numberwidth = 4,
	signcolumn = "yes",
	wrap = false,
	scrolloff = 8,
	sidescrolloff = 8,
}


for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.shortmess:append("c")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])

-- clipboard
vim.opt.clipboard:append("unnamedplus")