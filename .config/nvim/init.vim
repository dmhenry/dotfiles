"-----------------------------------------------------------------------------
" Plugin Configuration
"-----------------------------------------------------------------------------
" {{

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

    " Plugin for deleting, changing, and adding "surroundings"
    call minpac#add('tpope/vim-surround')
    " Comment stuff out
    call minpac#add('tpope/vim-commentary')
    " Pairs of handy bracket mappings
    call minpac#add('tpope/vim-unimpaired')
    " Repeat support for plugins
    call minpac#add('tpope/vim-repeat')
    " Continuously updated session files
    call minpac#add('tpope/vim-obsession')
    " Visual Studio Code Dark+-inspired theme 
    call minpac#add('tomasiser/vim-code-dark')
    " Dim inactive windows
    call minpac#add('blueyed/vim-diminactive')
endif

" Plugin settings here.

" Use codedark scheme
colorscheme codedark
"Add ObsessionStatus to statusline
" set statusline+=%{ObsessionStatus()} 

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()
" }}}

"-----------------------------------------------------------------------------
" Neovim Defaults for Vim
"-----------------------------------------------------------------------------
" {{{

" For details, see :help vim_diff or https://neovim.io/doc/user/vim_diff.html

if !has('nvim') && !exists('g:loaded_neovim_defaults')
    " If vanilla Vim and Neovim defaults not already loaded

    echom "Loading Neovim defaults"

    if has('syntax') && !exists('g:syntax_on')
        syntax enable
    endif

    filetype plugin indent on
    set autoindent
    set autoread
    set background=dark
    set backspace=indent,eol,start
    set belloff=all
    set complete-=i

    if has('cscopeverbose')
        set cscopeverbose
    endif

    " Make Vim respect XDG:
    " {{{
    "   https://tlvince.com/vim-respect-xdg
    "   https://wiki.archlinux.org/index.php/XDG_Base_Directory
    if exists('$XDG_DATA_HOME') && isdirectory($XDG_DATA_HOME)

        if has('persistent_undo')
            set undodir=$XDG_DATA_HOME/vim/undo
            call mkdir(&undodir, 'p')
        endif

        set directory=$XDG_DATA_HOME/vim/swap
        call mkdir(&directory, 'p')

        set backupdir=$XDG_DATA_HOME/vim/backup
        call mkdir(&backupdir, 'p')

        if has('viminfo')
            set viminfo+=!
            call mkdir($XDG_CACHE_HOME.'/vim', 'p')
            set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
        endif

        call mkdir($XDG_CONFIG_HOME.'/vim/after', 'p')

        set runtimepath=$XDG_CONFIG_HOME/vim,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after

        " if !filereadable($HOME.'/.vimrc') && !filereadable($HOME.'/vim/vimrc')
            " !ln -s $XDG_DATA_HOME/vim/vimrc $XDG_DATA_HOME/nvim/init.vim
            " !ln -s ~/.vimrc $XDG_DATA_HOME/vim/vimrc
        endif

    endif
    " }}}

    set display=lastline
    set encoding=utf-8
    
    if has('windows') && has('folding')
        set fillchars=
    endif

    set formatoptions=tcqj
    set fsync
    set history=10000

    if has('extra_search')
        set hlsearch
        set incsearch
    endif

    if has('langmap')
        set langnoremap
    endif

    set laststatus=2
    set listchars=tab:>\ ,trail:-,nbsp:+
    set nocompatible
    set nrformats=bin,hex
    
    if has('cmdline_info')
        set ruler
        set showcmd
    endif

    if has('mksession')
        set sessionoptions-=options
    endif

    set shortmess+=F
    set shortmess-=S
    set sidescroll=1
    set smarttab

    if has('windows')
        set tabpagemax=50
    endif

    if has('path_extra')
        set tags=./tags;,tags
    endif
    
    set ttimeoutlen=50
    set ttyfast
    
    if has('wildmenu')
        set wildmenu
    endif

    let g:loaded_neovim_defaults = 1
endif

" }}}

"-----------------------------------------------------------------------------
" General Preferences
"-----------------------------------------------------------------------------

set tabstop=4         " Number of spaces occupied by a <Tab>
set shiftwidth=4      " Number of spaces to indent/outdent using > or <
set softtabstop=4     " Delete expanded spaces as tabs
set expandtab         " Expand tabs to spaces
set hidden            " Allows modified buffers to be hidden w/o saving
set mouse=a           " Enable mouse for all modes
set colorcolumn=79    " Right gutter color

" Open vertical splits to the right, horizontal splits below
set splitbelow
set splitright

set termguicolors     " 24-bit color from terminal 

set ignorecase        " Ignore case when searching
set smartcase         " Unless a captial letter is entered

set undofile          " Persistent undo between sessions
if !(empty(&undodir) || isdirectory(&undodir))
    call mkdir(&undodir, 'p')
endif

let mapleader="\<Space>"

" Quickly open init.vim
nnoremap <Leader>ev :split $MYVIMRC<CR>
" Quickly source init.vim
nnoremap <Leader>sv :source $MYVIMRC<CR>

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
    if has('nvim')
        autocmd TermOpen * setlocal nonumber norelativenumber
    endif
    " Vim file settings
    autocmd FileType vim setlocal foldmethod=marker
augroup END
