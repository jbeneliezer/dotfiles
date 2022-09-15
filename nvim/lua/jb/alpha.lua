local alpha_ok, alpha = pcall(require, "alpha")
if not alpha_ok then
	return
end

local startify_ok, startify = pcall(require, "alpha.themes.startify")
if not startify_ok then
	return
end

alpha.setup(startify.config)
