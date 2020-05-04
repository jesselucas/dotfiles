" general config
set number
colo desert

" Install vim plug if needed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
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

" Auto formt rust with rustfmt
let g:rustfmt_autosave = 1

" rust rls
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

if executable('rls')
	au User lsp_setup call lsp#register_server({
		\ 'name': 'rls',
		\ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
		\ 'whitelist': ['rust'],
		\ })
endif 


" syntastic
Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
let g:syntastic_typescript_checkers = ['tslint', 'tsc'] 



" Async complete smart complete
" let g:asyncomplete_smart_completion = 1
" let g:asyncomplete_auto_popup = 1

" c

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_c_checkers = ['make', 'gcc', 'clang_check', 'clang_tidy']
" let g:syntastic_c_clang_tidy_sort = 1
" let g:syntastic_c_clang_check_sort = 1
" let g:syntastic_c_check_header = 1
" let g:syntastic_c_remove_include_errors = 1 
" let g:syntastic_rust_checkers = ['cargo']

" Go
" let g:syntastic_go_checkers = ['golint', 'govet']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

" NERDTree
Plug 'scrooloose/nerdtree'

" NERDTree show hidden files
let NERDTreeShowHidden=1

" NERDTree open if no file is selected
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTree mouse click
set mouse=a
let g:NERDTreeMouseMode=4

" NERDTree CTRL-N toggle 
map <C-n> :NERDTreeToggle<CR>

" NERDTree close when only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" prettier for javascript
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

" dart
Plug 'dart-lang/dart-vim-plugin'
let g:dart_format_on_save = 1

" TypeScript
Plug 'leafgarland/typescript-vim'

" Initialize plugin system
call plug#end()
