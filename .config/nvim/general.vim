"------------------------------------------------------------------------------
" Dave's NeoVim preferences
"------------------------------------------------------------------------------

let mapleader = "\<Space>"

" quickly open init.vim
nnoremap <Leader>ev :split $MYVIMRC<Cr>
" quickly open general.vim
nnoremap <Leader>egv :split $VIMCONFIG/general.vim<Cr>
" quickly source init.vim
nnoremap <Leader>sv :source $MYVIMRC<Cr>

set tabstop=4         " number of spaces occupied by a <Tab>
set shiftwidth=4      " number of spaces to indent/outdent using > or <
set softtabstop=4     " delete expanded spaces as tabs
set expandtab         " expand tabs to spaces
set hidden            " allows modified buffers to be hidden w/o saving
set mouse=a           " enable mouse for all modes
set history=200       " more command line and search history
set colorcolumn=80    " right gutter

" display relative line numbers from current absolute line number
set number relativenumber

" use Homebrew bash from vim & source my .bash_profile
set shell=/usr/local/bin/bash\ --rcfile\ ~/.bash_profile

" open vertical splits to the right, horizontal splits below
set splitbelow
set splitright

" change right margin column color
highlight ColorColumn ctermbg=darkgray
color dracula         " dracula colorscheme

" <Esc> clears last search highlight in normal mode
:nnoremap <Esc> :nohlsearch<Cr><Esc>

set ignorecase        " ignore case when searching
set smartcase         " unless a captial letter is entered
