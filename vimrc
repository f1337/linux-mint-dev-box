" Theme
colo molokai
syntax on

" font
if has('gui_running')
    set guifont=Menlo\ 12
endif



" Whitespace

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4



" Plugins

call plug#begin('~/.vim/plugged')

Plug 'godlygeek/tabular'

" lazy-load markdown plugin
Plug 'plasticboy/vim-markdown', { 'for': [ 'md', 'markdown' ] }

call plug#end()
