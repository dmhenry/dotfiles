"------------------------------------------------------------------------------
" Vim-Plug Configuration
"------------------------------------------------------------------------------

" Install vim-plug
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    " https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.local/share/nvim/plugged')

" Easily manipulate pairs of parentheses, brackets, quotes, etc.
Plug 'tpope/vim-surround'
" Toggle line comments
Plug 'tpope/vim-commentary'
" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'
" Repeat support for plugins
Plug 'tpope/vim-repeat'
" Dracula colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }
" Rainbow parentheses
Plug 'luochen1990/rainbow'
" Code completion engine
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }

call plug#end()

"------------------------------------------------------------------------------
" Plugin Configuration
"------------------------------------------------------------------------------

" Enable rainbow parentheses
let g:rainbow_active = 1
