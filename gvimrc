" window size
set lines=42 columns=132

" font
if has('gui_running')
    set guifont=Menlo\ 12
endif

" open URLs
:let g:netrw_browsex_viewer="setsid xdg-open"
