let mapleader=";"

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

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" strip trailing whitespace on save,
" for select file types
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()



" Plugins

call plug#begin('~/.vim/plugged')

" .editorconfig support
Plug 'editorconfig/editorconfig-vim'

" ultra-light powerline
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
"Plug 'itchyny/lightline.vim'
"Plug 'ap/vim-buftabline'
set laststatus=2

" lazy-load json plugin
Plug 'f1337/vim-json', { 'for': [ 'json' ] }

" vim-markdown prereq
Plug 'godlygeek/tabular'
" lazy-load markdown plugin
Plug 'plasticboy/vim-markdown', { 'for': [ 'md', 'markdown' ] }

" commentor
Plug 'tpope/vim-commentary'

" project-drawer antidote
Plug 'tpope/vim-vinegar'

call plug#end()



" Keybindings

" hijack built-in mappings

" buffer selection =~ 'select next/prev tab'
:nnoremap <silent> <C-PageDown> :bnext!<CR>
:nnoremap <silent> <C-PageUp> :bprevious!<CR>

" close buffer
:nnoremap <silent> <C-w> :bp\|bd #<CR>

" comment
:nmap <M-/> gcc
:vmap <M-/> gc

" copy
:nnoremap <C-Insert> y
" cut
:nnoremap <silent> <C-x> d
" paste
:nnoremap <S-Insert> p

"" select all
:nnoremap <C-a> ggVG
" shift-arrow selection
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>

" redo
:nnoremap <M-S-z> <C-r>
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

" toggle netrw
:map <Bslash> -



" per-project .vimrc
" set exrc
" set secure
