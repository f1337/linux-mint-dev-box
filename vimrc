" force vim to use bash, no matter the shell
set shell=/bin/bash

" line numbers on
set number

" Folding is infuriating
set nofoldenable



" Theme
colo molokai
syntax on



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
"Plug 'itchyny/lightline.vim'
"Plug 'ap/vim-buftabline'
set laststatus=2

" vim-markdown prereq
Plug 'godlygeek/tabular'

" lazy-load markdown plugin
Plug 'plasticboy/vim-markdown', { 'for': [ 'md', 'markdown' ] }

" commentor
Plug 'tpope/vim-commentary'

call plug#end()



" Keybindings

" hijack built-in mappings

" buffer selection =~ 'select next/prev tab'
:nnoremap <silent> <C-PageDown> :bnext!<CR>
:nnoremap <silent> <C-PageUp> :bprevious!<CR>

" close buffer
:nnoremap <silent> <C-w> :bp\|bd #<CR>

" comment
:nnoremap <silent> <C-/> gcc

" copy
:vnoremap <C-Insert> y
" cut
:vnoremap <silent> <C-x> d
" paste
:vnoremap <S-Insert> p
" redo
:nnoremap <C-y> <C-r>
" undo
:nnoremap <C-z> u

" find
:nnoremap <C-f> /
" find next
:nnoremap <F3> n
" find previous
:nnoremap <S-F3> N

" quit
:nnoremap <silent> <C-q> :qa<CR>

" save
:nnoremap <silent> <C-s> :w<CR>
