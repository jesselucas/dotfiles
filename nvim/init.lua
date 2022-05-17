vim.g.mapleader = ","
vim.g.localleader = "\\"

require('vars')
require('opts')
require('keys')
require('plugins')

require('nvim-tree-setup')
require('formatter-setup')

require'hop'.setup()
require'lspconfig'.clangd.setup {
    cmd = {
        'clangd', '--clang-tidy', '--background-index', '--std=c11',
        '--suggest-missing-includes', '--all-scopes-completion',
        '--header-insertion=iwyu', '--completion-style=detailed',
        '--pch-storage=memory'
    },
}
