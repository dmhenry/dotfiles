# macOS environment
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export _JAVA_OPTIONS='-Djava.net.preferIPv4Stack=true -Djava.net.preferIPv6Addresses=false'
export M2_HOME="$(/usr/local/bin/brew --prefix coreutils)/opt/maven/libexec"
export GRADLE_HOME="$(/usr/local/bin/brew --prefix)/opt/gradle/libexec"
export GROOVY_HOME="$(/usr/local/bin/brew --prefix)/opt/groovy/libexec"
export CATALINA_HOME="$(/usr/local/bin/brew --prefix)/opt/tomcat/libexec"
export PATH="$(/usr/local/bin/brew --prefix coreutils)/libexec/gnubin:${HOME}/bin:${PATH}"
export MANPATH="$(/usr/local/bin/brew --prefix coreutils)/libexec/gnuman:${MANPATH}"
export SHELL=/usr/local/bin/bash

set -o noclobber      # do not overwrite existing files with >
shopt -s autocd       # cd into paths on the command line 
shopt -s cdable_vars  # treat non-directory cd arguments as variables

alias ll="command ls --color=auto -ahlF $@"

export VISUAL=vim
export EDITOR="${VISUAL}"

# Homebrew
if [ -x "$(command -v brew)" ]; then
    for completion_file in $(/usr/local/bin/brew --prefix)/etc/bash_completion.d/*; do
        source "$completion_file"
    done
fi

# Neovim
if [ -x "$(command -v nvim)" ]; then
    export VISUAL=nvim
    export EDITOR="${VISUAL}"
    export VIMCONFIG="${HOME}/.config/nvim"
    export VIMDATA="${HOME}/.local/share/nvim"
    export MYVIMRC="${VIMCONFIG}/init.vim"

    alias vi=nvim
    alias vim=nvim
fi

# Git
export GIT_PS1_SHOWDIRTYSTATE=1
PS1='[\u@'"$(scutil --get LocalHostName)"' \W$(__git_ps1 " (%s)")]\$ '

# Use special bare repo for dotfiles in git. See:
#   https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
#   https://news.ycombinator.com/item?id=11071754
if [ -x "$(command -v git)" ]; then
    alias cfg='command git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
fi

# My environment variables
export dev="${HOME}/Development"
export sicp="${dev}/SICP/sicp/ch1"

# pull in Enterprise stuff
[[ -f ~/.bash_enterprise ]] && source ~/.bash_enterprise
