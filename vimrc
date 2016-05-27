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


" ultra-light powerline
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
set laststatus=2


" vim-markdown prereq
Plug 'godlygeek/tabular'

" lazy-load markdown plugin
Plug 'plasticboy/vim-markdown', { 'for': [ 'md', 'markdown' ] }

call plug#end()



" Keybindings

" hijack built-in mappings

" buffer selection =~ 'select next/prev tab'
:nnoremap <silent> <C-PageDown> :bnext!<CR>
:nnoremap <silent> <C-PageUp> :bprevious!<CR>

" find
:nnoremap <C-f> /
" find next
:nnoremap <F3> n
" find previous
:nnoremap <S-F3> N

" quit
:nnoremap <C-q> :qa<CR>

" save
:nnoremap <silent> <C-s> :w<CR>
