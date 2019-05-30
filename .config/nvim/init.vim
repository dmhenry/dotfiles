"------------------------------------------------------------------------------
" Plugin Configuration
"------------------------------------------------------------------------------
" {{{

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

" Enable rainbow parentheses
let g:rainbow_active = 1
" }}}

"------------------------------------------------------------------------------
" General Preferences
"------------------------------------------------------------------------------

set tabstop=4         " Number of spaces occupied by a <Tab>
set shiftwidth=4      " Number of spaces to indent/outdent using > or <
set softtabstop=4     " Delete expanded spaces as tabs
set expandtab         " Expand tabs to spaces
set hidden            " Allows modified buffers to be hidden w/o saving
set mouse=a           " Enable mouse for all modes
set history=200       " More command line and search history
set colorcolumn=80    " Right gutter color

" Open vertical splits to the right, horizontal splits below
set splitbelow
set splitright

" Change right margin column color
highlight ColorColumn ctermbg=darkgray
colorscheme dracula

set ignorecase        " Ignore case when searching
set smartcase         " Unless a captial letter is entered

" Search in 'very magic' regex mode by default
nnoremap / /\v
nnoremap ? ?\v

let mapleader = "\<space>"
let maplocalleader = "\<space>"

" Quickly open init.vim
nnoremap <leader>ev :split $MYVIMRC<cr>
" Quickly source init.vim
nnoremap <leader>sv :source $MYVIMRC<cr>

augroup GeneralPreferences
    autocmd!
    " Display relative line numbers from current absolute line number
    autocmd BufNewFile,BufRead * if &buftype != 'terminal' | set number relativenumber | endif
augroup END

augroup TerminalPreferences
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
    " autocmd InsertEnter * if &buftype ==? 'terminal' | echom "Insert in Terminal" | endif
    autocmd InsertEnter * echom "InsertEnter"
augroup END

" Effortless window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Esc clears last search highlight in normal mode
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>

" Expand current directory from command line mod
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

if has('nvim')
    " Esc switches from terminal mode back to normal mode
    tnoremap <Esc> <C-\><C-n>
    " Send Esc in terminal mode by prefixing
    tnoremap <C-v><Esc> <Esc>
    " Highlight terminal cursor position when in normal mode
    highlight! TermCursorNC guibg=green guifg=white ctermbg=green ctermfg=white
endif

" Vim file settings
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
