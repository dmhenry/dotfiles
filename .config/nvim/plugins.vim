"------------------------------------------------------------------------------
" Vim-Plug Configuration
"------------------------------------------------------------------------------

" Install vim-plug
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    " https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.local/share/nvim/plugged')

" Toggle relative numbers for normal mode; absolute for insert mode
Plug 'tpope/vim-surround'
" Toggle line comments
Plug 'tpope/vim-commentary'
" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'
" Repeat support for plugins
Plug 'tpope/vim-repeat'
" Dracula colorscheme
Plug 'dracula/vim'
" Rainbow parentheses
Plug 'luochen1990/rainbow'
" Status line
Plug 'vim-airline/vim-airline'
" File system explorer 
Plug 'scrooloose/nerdtree'

call plug#end()

"------------------------------------------------------------------------------
" Plugin Configuration
"------------------------------------------------------------------------------

" Enable rainbow parentheses
let g:rainbow_active = 1
" Enable powerline symbols - requires terminal to use a patched powerline font
let g:airline_powerline_fonts = 1
" Dispay buffers in tabline
let g:airline#extensions#tabline#enabled = 1

" Open NERDTree when nvim is opened on a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
    \ | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Open NERDTree when nvim is invoked with no files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close nvim if NERDTree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Close NERDTree upon opening a file
let NERDTreeQuitOnOpen = 1
" Delete the buffer of a deleted file
let NERDTreeAutoDeleteBuffer = 1
