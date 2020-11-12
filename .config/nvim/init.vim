"-------------------------------------------------------------------------------
" Plugin Configuration
"-------------------------------------------------------------------------------
" {{{

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

  " Plugin for deleting, changing, and adding 'surroundings'
  call minpac#add('tpope/vim-surround')
  " Comment stuff out
  call minpac#add('tpope/vim-commentary')
  " Pairs of handy bracket mappings
  call minpac#add('tpope/vim-unimpaired')
  " Repeat support for plugins
  call minpac#add('tpope/vim-repeat')
  " Continuously updated session files
  call minpac#add('tpope/vim-obsession')
  " Project code style
  call minpac#add('editorconfig/editorconfig-vim')
endif

" Plugin settings here.

" Add ObsessionStatus to statusline
set statusline=%{ObsessionStatus()} 

" Show colorcolumn on lines that exceed the max line length
let g:EditorConfig_max_line_indicator="exceeding"

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', 
            \{'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()
" }}}

"-------------------------------------------------------------------------------
" General Preferences
"-------------------------------------------------------------------------------

set shiftwidth=4      " Number of spaces to indent/outdent using > or <
set softtabstop=4     " Delete expanded spaces as tabs
set expandtab         " Expand tabs to spaces
set hidden            " Allows modified buffers to be hidden w/o saving
set mouse=a           " Enable mouse for all modes
set colorcolumn=81    " Right gutter color
set termguicolors     " Enables 24-bit RGB color in the Terminal UI
 
set ignorecase        " Ignore case when searching
set smartcase         " Unless a captial letter is entered

set number            " Show line numbers
set relativenumber    " Relative to current line

set undofile          " Persistent undo between sessions
if !(empty(&undodir) || isdirectory(&undodir))
  call mkdir(&undodir, 'p')
endif

" nmap <Space> <Bslash>
let mapleader="\<Space>"

" Esc clears last search highlight in normal mode
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>

" Quickly open init.vim
nnoremap <Leader>ev :split $MYVIMRC<CR>
" Quickly source init.vim
nnoremap <Leader>sv :source $MYVIMRC<CR>
