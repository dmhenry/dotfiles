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
" Code completion engine
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }

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
