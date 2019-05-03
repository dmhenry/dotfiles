"------------------------------------------------------------------------------
" Custom Mappings
"------------------------------------------------------------------------------

let mapleader = "\<Space>"

" Quickly open init.vim
nnoremap <Leader>ev :split $MYVIMRC<Cr>
" Quickly open general.vim
nnoremap <Leader>egv :split $VIMCONFIG/general.vim<Cr>
" Quickly source init.vim
nnoremap <Leader>sv :source $MYVIMRC<Cr>

" <Esc> clears last search highlight in normal mode
:nnoremap <Esc> :nohlsearch<Cr><Esc>

" Expand current directory from command line mod
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
