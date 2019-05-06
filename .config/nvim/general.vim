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

" Display relative line numbers from current absolute line number
set number relativenumber

" Use Homebrew bash from vim & source my .bash_profile
set shell=/usr/local/bin/bash\ --rcfile\ ~/.bash_profile

" Open vertical splits to the right, horizontal splits below
set splitbelow
set splitright

" Change right margin column color
highlight ColorColumn ctermbg=darkgray
colorscheme dracula

set ignorecase        " Ignore case when searching
set smartcase         " Unless a captial letter is entered
