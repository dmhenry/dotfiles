"-------------------------------------------------------------------------------
" minpac config
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
  " syntax checker
  call minpac#add('vim-syntastic/syntastic')
  " file system explorer 
  call minpac#add('scrooloose/nerdtree')
  " status line
  call minpac#add('vim-airline/vim-airline')
endif

" Plugin settings here.
" ...

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

"-------------------------------------------------------------------------------
" plugin config
"-------------------------------------------------------------------------------

" enable rainbow parentheses
let g:rainbow_active=1

" automatically dispay all buffers when only one tab is open
let g:airline#extensions#tabline#enabled = 1

