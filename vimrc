let mapleader=";"

" force vim to use bash, no matter the shell
set shell=/bin/bash

" line numbers on
set number

" Folding is infuriating
set nofoldenable

" mouse support in term
set mouse=a

" ride the lightning!
set nobackup
set noswapfile

" Theme
colorscheme molokai
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

" vim-markdown prereq
Plug 'godlygeek/tabular'

" ultra-light powerline
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
"Plug 'itchyny/lightline.vim'
"Plug 'ap/vim-buftabline'
set laststatus=2

" autoclose parens and brackets
Plug 'Townk/vim-autoclose'

" commentor
Plug 'tpope/vim-commentary'

" lazy-load json plugin
Plug 'f1337/vim-json', { 'for': [ 'json' ] }

" lazy-load markdown plugin
Plug 'plasticboy/vim-markdown', { 'for': [ 'md', 'markdown' ] }

" all the language support plugins, lazy-loaded
Plug 'sheerun/vim-polyglot'

" project-drawer antidote
Plug 'tpope/vim-vinegar'

call plug#end()



" Keybindings

" autocomplete
imap <C-Space> <C-X><C-O>

" buffer selection =~ 'select next/prev tab'
map <silent> <C-PageUp> :bprevious!<CR>
map! <silent> <C-PageUp> <C-O>:bprevious!<CR>
map <silent> <C-PageDown> :bnext!<CR>
map! <silent> <C-PageDown> <C-O>:bnext!<CR>

" close buffer
map <silent> <C-w> :bp\|bd #<CR>
map! <silent> <C-w> <C-O>:bp\|bd #<CR>

" comment
nmap <M-/> gcc
vmap <M-/> gc
imap <M-/> <C-O>gcc

" copy
" :nnoremap <C-Insert> y
" cut
" :nnoremap <silent> <C-x> d
" paste
" :nnoremap <S-Insert> p

" copy
noremap <C-Insert> "+y
" vnoremap <C-c> "+y

" paste
set pastetoggle=<F22>
inoremap <S-Insert> <F22><C-r>+<F22>


"" select all
map <C-a> ggVG
map! <C-a> <esc>ggVG

" shift-arrow selection
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <C-O>v<Up>
imap <S-Down> <C-O>v<Down>
imap <S-Left> <C-O>v<Left>
imap <S-Right> <C-O>v<Right>

" redo
:nnoremap <C-S-z> <C-r>
" undo
map <C-z> u
map! <C-z> <C-O>u

" find
map <C-f> /
map! <C-f> <C-O>/
" find next
map <F3> n
map! <F3> <C-O>n
" find previous
map <S-F3> N
map! <S-F3> <C-O>N

" new file
:nnoremap <C-n> :ene<CR>

" quit
map <silent> <C-q> :qa<CR>
map! <silent> <C-q> <C-O>:qa<CR>

" save
map <silent> <C-s> :w<CR>
map! <silent> <C-s> <C-O>:w<CR>

" toggle netrw
map <Bslash> -



" per-project .vimrc
" set exrc
" set secure
