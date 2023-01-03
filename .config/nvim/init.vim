"-------------------------------------------------------------------------------
" Plugins
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

function! PackInit() abort 
  packadd minpac

  " minpac is loaded.
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.

  " Dracula theme
  call minpac#add('dracula/vim', {'name': 'dracula'})
  " Git plugin
  call minpac#add('tpope/vim-fugitive')
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
  " Command-line fuzzy finder
  call minpac#add('junegunn/fzf', {'do': {-> fzf#install()}})
  " Optional key bindings for junegunn/fzf
  call minpac#add('junegunn/fzf.vim')
  " Node.js extension host
  call minpac#add('neoclide/coc.nvim', {'name': 'coc', 'branch': 'release'})
  " Navigate seamlessly between vim and tmux
  call minpac#add('christoomey/vim-tmux-navigator')
  " Tag management
  call minpac#add('ludovicchabant/vim-gutentags')
  " Debug adapter
  call minpac#add('puremourning/vimspector')
endfunction

" Plugin settings here.

" dracula/vim:
colorscheme dracula

" ludovicchabant/vim-gutentags
let g:gutentags_modules = ['ctags']
let g:gutentags_ctags_exclude = ['.git', '.github', '.vscode']
let g:gutentags_cscope_build_inverted_index = 1

" neoclide/coc.nvim
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

packloadall

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac  | call minpac#status()
" }}}

"-------------------------------------------------------------------------------
" Welcome!
"-------------------------------------------------------------------------------
echo ">^.^<"

"-------------------------------------------------------------------------------
" General Preferences
"-------------------------------------------------------------------------------

let mapleader="\<Space>"

set shiftwidth=4      " Number of spaces to indent/outdent using > or <
set softtabstop=4     " Delete expanded spaces as tabs
set tabstop=4         " Number of spaces that a <Tab> in the file counts for
set expandtab         " Expand tabs to spaces
set hidden            " Allows modified buffers to be hidden w/o saving
set mouse=a           " Enable mouse for all modes
set colorcolumn=120   " Right gutter color
set termguicolors     " Enables 24-bit RGB color in the Terminal UI
set showtabline=2     " Show tabline
 
set ignorecase        " Ignore case when searching
set smartcase         " Unless a captial letter is entered

set number            " Show line numbers
set relativenumber    " Relative to current line

set splitbelow        " Split windows below
set splitright        " Split windows right

set undofile          " Persistent undo between sessions
if !(empty(&undodir) || isdirectory(&undodir))
  call mkdir(&undodir, 'p')
endif

" Quickly open init.vim
nnoremap <Leader>ve :tabedit $MYVIMRC<CR>
" Quickly source init.vim
nnoremap <Leader>vs :source $MYVIMRC<CR>
" Esc clears last search highlight in normal mode
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>

" Break out of terminal window even when in insert mode
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <C-w> <C-\><C-n><C-w>
tnoremap <C-^> <C-\><C-n><C-^>

augroup Terminal
  autocmd!
  " Terminal cursor begins in insert mode
  autocmd TermOpen,BufEnter * if &buftype == 'terminal' | :startinsert | endif
  " Terminal doesn't have line numbers
  autocmd TermOpen,BufEnter term://* setlocal nonumber norelativenumber
  " Map <Esc> to exit terminal-mode
  autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
  " ... except when the terminal is FZF
  autocmd FileType fzf tunmap <silent> <buffer> <Esc>
  " Type 'K' in vim files to jump to help for the word under the cursor
augroup END

augroup Vim
  autocmd!
  " Type 'K' in vim files to jump to help for the word under the cursor
  autocmd FileType vim setlocal keywordprg=:help
  " Automatically fold on {{{,}}}
  autocmd FileType vim setlocal foldmethod=marker
augroup END
