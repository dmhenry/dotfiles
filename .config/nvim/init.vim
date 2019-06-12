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
    " Git wrapper
    call minpac#add('tpope/vim-fugitive')
    " Dracula colorscheme
    call minpac#add('dracula/vim', {'name': 'vim-dracula'})
    " Rainbow parentheses
    call minpac#add('luochen1990/rainbow', {'name': 'vim-rainbow'})
    " Dim inactive windows
    call minpac#add('blueyed/vim-diminactive')
    " Code completion engine
    call minpac#add('Valloric/YouCompleteMe', {'name': 'vim-ycm', 'do': '!./install.py --all'})
endif

" Plugin settings here.

" Explicityly load all <dir>/pack/<package_name>/start/<plugin_name>
packloadall
" Enable rainbow parentheses
let g:rainbow_active=1
" Use dracula
colorscheme dracula
" Add ObsessionStatus to statusline
" set statusline+=%{ObsessionStatus()} 

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate packadd minpac | source ${MYVIMRC} | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source ${MYVIMRC} | call minpac#clean()
command! PackStatus packadd minpac | source ${MYVIMRC} | call minpac#status()
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

set undofile          " Persistent undo between sessions
if !has('nvim')
    set undodir=~/.vim/undo
endif
if !isdirectory(&undodir)
    echom 'Creating undo directory at ' . &undodir
    call mkdir(&undodir, 'p')
endif

" Search in 'very magic' regex mode by default
nnoremap / /\v
nnoremap ? ?\v

let mapleader="\<Space>"

" Quickly open init.vim
nnoremap <Leader>ev :split ${MYVIMRC}<CR>
" Quickly source init.vim
nnoremap <Leader>sv :source ${MYVIMRC}<CR>

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

augroup vimrc
    autocmd!
    " Disable undofile for files in /tmp
    autocmd BufWritePre /tmp/* setlocal noundofile
    " Display relative line numbers from current absolute line number
    autocmd BufRead * if &buftype != 'terminal' | set number relativenumber | endif
    " ... except in terminal
    autocmd TermOpen * setlocal nonumber norelativenumber
    " Vim file settings
    autocmd FileType vim setlocal foldmethod=marker
augroup END
