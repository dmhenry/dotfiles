"------------------------------------------------------------------------------
" Plugin Configuration
"------------------------------------------------------------------------------
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
    
    " Easily manipulate pairs of parentheses, brackets, quotes, etc.
    call minpac#add('tpope/vim-surround')
    " Toggle line comments
    call minpac#add('tpope/vim-commentary')
    " Pairs of handy bracket mappings
    call minpac#add('tpope/vim-unimpaired')
    " Repeat support for plugins
    call minpac#add('tpope/vim-repeat')
    " Automatic session handling
    call minpac#add('tpope/vim-obsession')
    " Dracula colorscheme
    call minpac#add('dracula/vim', {'name': 'vim-dracula'})
    " Rainbow parentheses
    call minpac#add('luochen1990/rainbow', {'name': 'vim-rainbow'})
    " Dim inactive windows
    call minpac#add('blueyed/vim-diminactive')
endif

" Plugin settings here.

" Explicityly load all <dir>/pack/<package_name>/start/<plugin_name>
packloadall
" Enable rainbow parentheses
let g:rainbow_active=1
" Use dracula
colorscheme dracula

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()
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
set colorcolumn=80    " Right gutter color

" Open vertical splits to the right, horizontal splits below
set splitbelow
set splitright

set termguicolors     " 24-bit color from terminal 

set ignorecase        " Ignore case when searching
set smartcase         " Unless a captial letter is entered

" Search in 'very magic' regex mode by default
nnoremap / /\v
nnoremap ? ?\v

let mapleader="\<Space>"

" Quickly open init.vim
nnoremap <Leader>ev :split $MYVIMRC<CR>
" Quickly source init.vim
nnoremap <Leader>sv :source $MYVIMRC<CR>

augroup GeneralPreferences
    autocmd!
    " Display relative line numbers from current absolute line number
    autocmd BufRead * if &buftype != 'terminal' | set number relativenumber | endif
augroup END

augroup TerminalPreferences
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" Effortless window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Break out of terminal window even when in insert mode
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Esc clears last search highlight in normal mode
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>

" Expand current directory from command line mod
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

if has('nvim')
    if executable('nvr')
        " Use existing Neovim process when $VISUAL is invoked from Neovim terminal
        " Open $VISUAL in existing Neovim process
        let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    endif

    " Highlight terminal cursor position when in normal mode (green)
    highlight! TermCursorNC guibg=#50FA7B guifg=white ctermbg=lightgreen ctermfg=white
endif

" Vim file settings
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

