local util = require("formatter.util")

require("formatter").setup({
	filetype = {
		c = { require("formatter.filetypes.c").clangformat },
		lua = { require("formatter.filetypes.lua").stylua },
		rust = { require('formatter.filetypes.rust').rustfmt },
--		zig = { require('formatter.filetypes.zig').zigfmt },
		go = { require('formatter.filetypes.go').gofmt },
	},
})

vim.api.nvim_exec(
       [[
    augroup FormatAutogroup
           autocmd!
               autocmd BufWritePost * FormatWrite
               augroup END
       ]],
       true
)

