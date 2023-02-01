vim.g.mapleader = ","
vim.g.localleader = "\\"

require("vars")
require("opts")
require("keys")
require("plugins")
require("cmp-setup")
require("nvim-tree-setup")
require("formatter-setup")

require("hop").setup()
require("lspconfig").clangd.setup({
	cmd = {
		"clangd",
		"--clang-tidy",
		"--suggest-missing-includes",
		"--all-scopes-completion",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--pch-storage=memory",
	},
})
require("lspconfig")["rust_analyzer"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	settings = {
		["rust-analyzer"] = {
			assist = {
				importGranularity = "module",
				importPrefix = "self",
			},
			cargo = {
				loadOutDirsFromCheck = true,
			},
			procMacro = {
				enable = true,
			},
		},
	},
})
require("lspconfig").zls.setup({})
