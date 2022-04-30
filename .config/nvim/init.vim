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
    " Command-line fuzzy finder
    call minpac#add('junegunn/fzf', {'do': {-> fzf#install()}})
    " Optional key bindings for junegunn/fzf
    call minpac#add('junegunn/fzf.vim')
    " Node.js extension host
    call minpac#add('neoclide/coc.nvim', {'name': 'coc', 'branch': 'release'})
    " Navigate seamlessly between vim and tmux
    call minpac#add('christoomey/vim-tmux-navigator')
    " File system explorer
    call minpac#add('preservim/nerdtree')
    " Add file icons to NERDTree (requires nerd fonts)
    call minpac#add('ryanoasis/vim-devicons')
    " Improve syntax for devicons on NERDTree 
    call minpac#add('tiagofumo/vim-nerdtree-syntax-highlight')
    " Tag sidebar
    call minpac#add('preservim/tagbar')
    " Go language support
    call minpac#add('fatih/vim-go', {'do': ':GoInstallBinaries'})
    " Synatx checker
    call minpac#add('vim-syntastic/syntastic')
    " AI code completion
    call minpac#add('github/copilot.vim')
    " Tag management
    call minpac#add('ludovicchabant/vim-gutentags')
    " Debug adapter
    call minpac#add('puremourning/vimspector')
endfunction

" Plugin settings here.

" dracula/vim:
colorscheme dracula

" fatih/vim-go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

" vim-syntastic/syntastic 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['go', 'gofmt', 'govet']

" ludovicchabant/vim-gutentags
let g:gutentags_modules = ['ctags']
let g:gutentags_ctags_exclude = ['.git', '.github', '.shadowenv.d', '.vscode', 'node_modules', 'vendor']
let g:gutentags_cscope_build_inverted_index = 1

packloadall

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate source  $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean  source  $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac   | call PackInit() | call minpac#status()
" }}}

"-------------------------------------------------------------------------------
" Welcome!
"-------------------------------------------------------------------------------
echo ">^.^<"

"-------------------------------------------------------------------------------
" General Preferences
"-------------------------------------------------------------------------------

let mapleader="\<Space>"

function! s:ConfigureDefaults()
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
   
    augroup Vim
        autocmd!
        autocmd TermOpen * setlocal nonumber norelativenumber
        " Map <Esc> to exit terminal-mode
        autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
        " ... except when the terminal is FZF
        autocmd FileType fzf tunmap <silent> <buffer> <Esc>
        " Type 'K' in vim files to jump to help for the word under the cursor
        autocmd FileType vim setlocal keywordprg=:help
        " Automatically fold on {{{,}}}
        autocmd FileType vim setlocal foldmethod=marker
    augroup END
endfunction

function! s:ConfigureFZF()
    if  exists('g:loaded_fzf') && executable('fzf')
        if exists(':FZF')     | nnoremap <silent> <Leader>f :FZF<CR>     | endif
        if exists(':Buffers') | nnoremap <silent> <Leader>b :Buffers<CR> | endif
    else 
        echomsg 's:ConfigureFZF(): Plugin fzf not loaded or fzf binary not found'
    endif
endfunction

function! s:ConfigureNERDTree()
    if exists('g:loaded_nerd_tree')
        nnoremap <Leader>n :NERDTreeToggle<CR>

        augroup s:ConfigureNERDTree
            autocmd!
            " Exit Vim if NERDTree is the only window remaining in the only tab.
            autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
            " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
            autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
                \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
        augroup END
    else
        echomsg 's:ConfigureNERDTree(): Plugin NERDTree not loaded'
    endif
endfunction

function! s:ConfigureTagbar()
    if exists(':Tagbar') && executable('ctags')
        nnoremap <Leader>t :TagbarToggle<CR>
    else
        echomsg 's:ConfigureTagbar(): Plugin Tagbar not loaded or ctags binary not found'
    endif
endfunction

function! s:ConfigurePlugins()
    call s:ConfigureFZF()
    call s:ConfigureNERDTree()
    call s:ConfigureTagbar()
    call s:ConfigureVimspector()
endfunction

augroup Configure
    autocmd!
    call s:ConfigureDefaults()
    autocmd VimEnter * call s:ConfigurePlugins()
augroup END

function! s:ConfigureVimspector()
    " for normal mode - the word under the cursor
    nnoremap <Leader>di <Plug>VimspectorBalloonEval
    " for visual mode, the visually selected text
    xnoremap <Leader>di <Plug>VimspectorBalloonEval

    nnoremap <Leader>db :call vimspector#ToggleBreakpoint()<CR>
    " nnoremap <Leader>dB :call vimspector#ClearBreakpoints()<CR>
    nnoremap <Leader>dl :call vimspector#ListBreakpoints()<CR>
    " nnoremap <Leader>dc :call vimspector#Continue()<CR>
    " nnoremap <Leader>dS :call vimspector#Stop()<CR>
    nnoremap <Leader>dr :call vimspector#Restart()<CR>
    nnoremap <Leader>dd :call vimspector#Launch()<CR>
    " nnoremap <Leader>dp :call vimspector#Pause()<CR>
    " nnoremap <Leader>dg :call vimspector#GoToCurrentLine()<CR>
    " nnoremap <Leader>dp :call vimspector#RunToCursor()<CR>
    nnoremap <Leader>dR :call vimspector#Reset()<CR>
    " nnoremap <Leader>ds :call vimspector#StepOver()<CR>
    " nnoremap <Leader>di :call vimspector#StepInto()<CR>
    " nnoremap <Leader>do :call vimspector#StepOut()<CR>
    " nnoremap <Leader>df :call vimspector#UpFrame()<CR>
    " nnoremap <Leader>dF :call vimspector#DownFrame()<CR>
    " nnoremap <Leader>de :VimspectorEval<Space>
    " nnoremap <Leader>dw :VimspectorWatch<Space>
    " nnoremap <Leader>dm :VimspectorMkSession<CR>
    " nnoremap <Leader>dM :VimspectorMkSession<Space>
    " nnoremap <Leader>dn :VimspectorLoadSession<CR>
    " nnoremap <Leader>dN :VimspectorLoadSession<Space>
endfunction

" Custom mappings while debugging {{{
let maplocalleader="\<Space>"
let s:mapped = {}

function! s:OnJumpToFrame() abort
    if has_key( s:mapped, string( bufnr() ) )
        return
    endif
  
    nmap <silent> <buffer> <LocalLeader>dn <Plug>VimspectorStepOver
    nmap <silent> <buffer> <LocalLeader>ds <Plug>VimspectorStepInto
    nmap <silent> <buffer> <LocalLeader>df <Plug>VimspectorStepOut
    nmap <silent> <buffer> <LocalLeader>dc <Plug>VimspectorContinue
    nmap <silent> <buffer> <LocalLeader>di <Plug>VimspectorBalloonEval
    xmap <silent> <buffer> <LocalLeader>di <Plug>VimspectorBalloonEval
  
    let s:mapped[ string( bufnr() ) ] = { 'modifiable': &modifiable }
  
    setlocal nomodifiable
endfunction

function! s:OnDebugEnd() abort
    let original_buf = bufnr()
    let hidden = &hidden
    augroup VimspectorSwapExists
        autocmd!
        autocmd SwapExists * let v:swapchoice='o'
    augroup END

    try
        set hidden
        for bufnr in keys( s:mapped )
            try
                execute 'buffer' bufnr
                silent! nunmap <buffer> <LocalLeader>dn
                silent! nunmap <buffer> <LocalLeader>ds
                silent! nunmap <buffer> <LocalLeader>df
                silent! nunmap <buffer> <LocalLeader>dc
                silent! nunmap <buffer> <LocalLeader>di
                silent! xunmap <buffer> <LocalLeader>di

                let &l:modifiable = s:mapped[ bufnr ][ 'modifiable' ]
            endtry
        endfor
    finally
        execute 'noautocmd buffer' original_buf
        let &hidden = hidden
    endtry

    autocmd! VimspectorSwapExists

    let s:mapped = {}
endfunction

augroup DebugCustomMappings
    autocmd!
    autocmd User VimspectorJumpedToFrame call s:OnJumpToFrame()
    autocmd User VimspectorDebugEnded ++nested call s:OnDebugEnd()
augroup END

