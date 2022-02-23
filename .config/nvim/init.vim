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

packadd minpac

function! PackInit() abort 
    " minpac is loaded.
    call minpac#init()
    call minpac#add('k-takata/minpac', {'type': 'opt'})

    " Additional plugins here.

    " Dracula theme
    call minpac#add('dracula/vim', {'name': 'dracula'})
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
    " End certain structures automatically
    call minpac#add('tpope/vim-endwise')
    " Vim plugin for editing Ruby on Rails applications
    call minpac#add('tpope/vim-rails')
    " Full path fuzzy file, buffer, mru, tag, ... finder
    call minpac#add('kien/ctrlp.vim', {'name': 'ctrlp'})
    " Node.js extension host
    call minpac#add('neoclide/coc.nvim', {'name': 'coc', 'branch': 'release'})
    " Navigate seamlessly between vim and tmux
    call minpac#add('christoomey/vim-tmux-navigator')
    " File system explorer
    call minpac#add('preservim/nerdtree')
endfunction

" Plugin settings here.
packloadall

" tpope/vim-obsession:
" set statusline+=%{ObsessionStatus()}         " Add ObsessionStatus to statusline
" dracula/vim:
colorscheme dracula

" 
let g:coc_global_extensions = [ 'coc-solargraph', 'coc-json', 'coc-git' ]

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac  | call PackInit() | call minpac#status()
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

set foldmethod=marker " Automatically fold on {{{,}}}

set undofile          " Persistent undo between sessions
if !(empty(&undodir) || isdirectory(&undodir))
  call mkdir(&undodir, 'p')
endif

" nmap <Space> <Bslash>
let mapleader="\<Space>"

" Quickly open init.vim
nnoremap <Leader>ev :split $MYVIMRC<CR>
" Quickly source init.vim
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Esc clears last search highlight in normal mode
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>

" Auto-save changed buffers after 'updatetime' ms
autocmd CursorHold,CursorHoldI * silent! update
