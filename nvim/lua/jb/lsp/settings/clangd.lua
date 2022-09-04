local clangd_flags = {
	--[[ "--all-scopes-completion", ]]
	--[[ "--suggest-missing-includes", ]]
	--[[ "--background-index", ]]
	--[[ "--pch-storage=disk", ]]
	--[[ "--cross-file-rename", ]]
	--[[ "--log=info", ]]
	--[[ "--completion-style=detailed", ]]
	--[[ "--enable-config", -- clangd 11+ supports reading from .clangd configuration file ]]
	--[[ "--clang-tidy", ]]
	-- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
	"--style='{BasedOnStyle: Google, IndentWidth: 4, AccessModifierOffset: -4}'",
	--[[ "--fallback-style='{BasedOnStyle: Google, IndentWidth: 4, AccessModifierOffset: -4}'", ]]
	-- "--header-insertion=never",
	-- "--query-driver=<list-of-white-listed-complers>"
}


local opts = {
	cmd = { "clangd", unpack(clangd_flags) },
	--[[ on_attach = custom_on_attach, ]]
}

return {
	opts,
	--[[ cmd = { "clangd", " --style='{BasedOnStyle: Google, IndentWidth: 4, AccessModifierOffset: -4}'" }, ]]
}
