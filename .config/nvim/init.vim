"-------------------------------------------------------------------------------
" minpac
"-------------------------------------------------------------------------------
" For a paranoia.
" Normally `:set nocp` is not needed, because it is done automatically
" when .vimrc is found.
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

if exists('*minpac#init')
  " minpac is loaded.
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.

  " Racket language grammar
  call minpac#add('wlangstroth/vim-racket')
  " toggle relative numbers for normal mode; absolute for insert mode
  call minpac#add('tpope/vim-surround')
  " toggle line comments
  call minpac#add('tpope/vim-commentary')
  " pairs of handy bracket mappings
  call minpac#add('tpope/vim-unimpaired')
  " repeat support for plugins
  call minpac#add('tpope/vim-repeat')
  " dracula colorscheme
  call minpac#add('dracula/vim')
  " rainbow parentheses
  call minpac#add('luochen1990/rainbow')
endif

" Plugin settings here.
" ...

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

"-------------------------------------------------------------------------------
" Dave's NeoVim preferences
"-------------------------------------------------------------------------------
set tabstop=2         " number of spaces occupied by a <Tab>
set shiftwidth=2      " number of spaces to indent/outdent using > or <
set softtabstop=2     " delete expanded spaces as tabs
set expandtab         " expand tabs to spaces
set hidden            " allows modified buffers to be hidden w/o saving
set mouse=a           " enable mouse for all modes
set history=200       " more command line and search history
set colorcolumn=81    " right gutter

" display relative line numbers from current absolute line number
set number relativenumber

" use Homebrew bash from vim & source my .bash_profile
set shell=/usr/local/bin/bash\ --rcfile\ ~/.bash_profile

" change right margin column color
highlight ColorColumn ctermbg=darkgray
color dracula         " dracula colorscheme

" enable rainbow parentheses
let g:rainbow_active=1

" <Esc> clears last search highlight in normal mode
:nnoremap <esc> :nohlsearch<cr><esc>

