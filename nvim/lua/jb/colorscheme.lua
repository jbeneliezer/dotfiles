local status_ok, _ = pcall(require, "tokyonight")
if not status_ok then
	return
end

vim.g.tokyonight_style = "storm"

vim.cmd[[ colorscheme tokyonight ]]
