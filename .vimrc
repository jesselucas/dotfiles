" general confi
set number

" set color scheme
colo desert

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

" rls
if executable('rls')
	au User lsp_setup call lsp#register_server({
		\ 'name': 'rls',
		\ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
		\ 'whitelist': ['rust'],
		\ })
endif 

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" vim plug help
Plug 'junegunn/vim-plug'

" easy motion
Plug 'easymotion/vim-easymotion'

" rust
Plug 'rust-lang/rust.vim'
Plug 'timonv/vim-cargo'

" rust rls
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'


" c
Plug 'vim-syntastic/syntastic'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_fmt_command = "goimports"

" prettier for javascript
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

" Initialize plugin system
call plug#end()
