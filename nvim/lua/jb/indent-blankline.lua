local status_ok, indent = pcall(require, "indent_blankline")
if not status_ok then
	return
end

vim.cmd([[ highlight IndentBlanklineContextStart guisp=#00FF00 gui=nocombine ]])

indent.setup({
	show_current_context = true,
	show_current_context_start = true,
	show_end_of_line = true,
})
