set -o physical
set -o noclobber      # do not overwrite existing files with >
shopt -s autocd       # cd into paths on the command line 
shopt -s cdable_vars  # treat non-directory cd arguments as variables

alias ll="ls --color=auto -alF $@"

# 
# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
# https://news.ycombinator.com/item?id=11071754
config='/usr/local/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# source bash completion files
if type brew > /dev/null 2>&1; then
  for completion_file in $(/usr/local/bin/brew --prefix)/etc/bash_completion.d/*; do
    source "$completion_file"
  done
fi

# NeoVim
if type nvim > /dev/null 2>&1; then
  alias vi=nvim
  alias vim=nvim
fi

# jEnv
eval "$(jenv init -)"

# Git prompt
PS1='[\u@'"$(scutil --get LocalHostName)"' \W$(__git_ps1 " (%s)")]\$ '
