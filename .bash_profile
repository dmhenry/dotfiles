set -o noclobber      # do not overwrite existing files with >
shopt -s autocd       # cd into paths on the command line 
shopt -s cdable_vars  # treat non-directory cd arguments as variables

export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export _JAVA_OPTIONS='-Djava.net.preferIPv4Stack=true -Djava.net.preferIPv6Addresses=false'
export M2_HOME=/usr/local/opt/maven/libexec
export GRADLE_HOME=/usr/local/opt/gradle/libexec
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export CATALINA_HOME=/usr/local/opt/tomcat/libexec
export GOROOT=/usr/local/opt/go/libexec
export GOPATH="$HOME/go"
export PATH="$(/usr/local/bin/brew --prefix coreutils)/libexec/gnubin:$HOME/bin:$PATH:/usr/local/sbin:$GOPATH/bin:$GOROOT/bin"
export MANPATH="$(/usr/local/bin/brew --prefix coreutils)/libexec/gnuman:$MANPATH"
export SHELL=/usr/local/bin/bash
export VISUAL=vim
export EDITOR="$VISUAL"

# NeoVim
if type nvim > /dev/null 2>&1; then
  export VISUAL=/usr/local/bin/nvim
  export EDITOR="$VISUAL"
  export VIMCONFIG="$HOME/.config/nvim"
  export VIMDATA="$HOME/.local/share/nvim"
  export MYVIMRC="$VIMCONFIG/init.vim"
  alias vi=nvim
  alias vim=nvim
fi

# Set pyenv compiler & linker flags
pyenv() {
  if [[ $1 == "install" ]]; then
    TEMP_LDFLAGS="$LDFLAGS"
    TEMP_CPPFLAGS="$CPPFLAGS"
    TEMP_PKG_CONFIG_PATH="$PKG_CONFIG_PATH"
    export LDFLAGS="$LDFLAGS -L/usr/local/opt/sqlite/lib -L/usr/local/opt/zlib/lib"
    export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/sqlite/include -I/usr/local/opt/zlib/include"
    export PKG_CONFIG_PATH="$PKG_CONFIG_PATH /usr/local/opt/sqlite/lib/pkgconfig /usr/local/opt/zlib/lib/pkgconfig"
    command pyenv $@
    export LDFLAGS="$TEMP_LDFLAGS"
    export CPPFLAGS="$TEMP_CPPFLAGS"
    export PKG_CONFIG_PATH="$TEMP_PKG_CONFIG_PATH"
  else
    command pyenv $@
  fi
}

# IPython
if type nvim > /dev/null 2>&1; then
  export IPYTHONCONFIG="$HOME/.ipython/profile_default/ipython_config.py"
fi

alias ll="command ls --color=auto -alF $@"

# Git
export GIT_PS1_SHOWDIRTYSTATE=1
PS1='[\u@'"$(scutil --get LocalHostName)"' \W$(__git_ps1 " (%s)")]\$ '

# Use special bare repo for dotfiles in git. See:
#   https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
#   https://news.ycombinator.com/item?id=11071754
alias cfg='command git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Homebrew
if type brew > /dev/null 2>&1; then
  for completion_file in $(/usr/local/bin/brew --prefix)/etc/bash_completion.d/*; do
    source "$completion_file"
  done
fi

# My environment variables
export dev="$HOME/Development"
export sicp="$dev/SICP/sicp/ch1"

# pull in Enterprise stuff
[[ -f ~/.bash_enterprise ]] && source ~/.bash_enterprise

