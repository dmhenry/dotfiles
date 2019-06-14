set -o noclobber      # do not overwrite existing files with >
shopt -s autocd       # cd into paths on the command line 
shopt -s cdable_vars  # treat non-directory cd arguments as variables

# Neovim
if [ -x "$(command -v nvim)" ]; then
    export VISUAL=/c/tools/neovim/Neovim/bin/nvim-qt.exe
    export EDITOR="$VISUAL"
    export VIMCONFIG="$HOME/AppData/Local/nvim"
    export VIMDATA="$HOME/AppData/Local/nvim-data"
    export MYVIMRC="$VIMCONFIG/init.vim"
    alias nvim='/c/tools/neovim/Neovim/bin/nvim-qt.exe'

    if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
        alias nvim='echo "No nesting!"'
    fi
fi

# Git
export GIT_PS1_SHOWDIRTYSTATE=1
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    # Change bash prompt when running Neovim's terminal emulator
    PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n» ' 
fi

# Use special bare repo for dotfiles in git. See:
#   https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
#   https://news.ycombinator.com/item?id=11071754
if [ -x "$(command -v git)" ]; then
    alias cfg='command git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
fi

#==============================================================================
# BLACKDUCK SCAN
#=============================================================================

# Replace the value w/ the one you just created in "Create BlackDuck User Access Token"
export HUB_TOKEN="NTA0Mjc5MzAtYjVmZS00MTg1LTgyMjMtYjcxZTY3OTdlOGQyOjBkOTNjZDkzLTQxOTAtNGFjZS1hZGY3LTc3NzBjM2VhYThlZQ=="
 
# Put the scripts dir from ssh://git@git-int.ehi.com:7999/ec/bd-automation.git into your path:
# common windows location:
export PATH="$PATH:$HOME/Development/Projects/GBP/bd-automation/scripts"
 
# IF External Devloper Use
# export PATH="$PATH:/c/tools/blackduck
USERNAME="E481NX"
 
# Tell blackduck the location of your "temp directory" default is /tmp
export DETECT_JAR_PATH=/c/Temp
