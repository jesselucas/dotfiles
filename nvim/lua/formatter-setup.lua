local util = require("formatter.util")

require("formatter").setup({
	filetype = {
		c = { require("formatter.filetypes.c").clangformat },
		lua = { require("formatter.filetypes.lua").stylua },
		rust = { require('formatter.filetypes.rust').rustfmt },
		zig = { require('formatter.filetypes.zig').zigfmt },
	},
})
