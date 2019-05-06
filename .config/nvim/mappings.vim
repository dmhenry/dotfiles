"------------------------------------------------------------------------------
" Custom Mappings
"------------------------------------------------------------------------------

" Effortless window navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Esc clears last search highlight in normal mode
nnoremap <esc> :nohlsearch<cr><esc>

" Expand current directory from command line mod
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
