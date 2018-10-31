export JAVA_HOME="/Library/Java/Home"
# unset _JAVA_OPTIONS when using jenv add
export _JAVA_OPTIONS='-Djava.net.preferIPv4Stack=true -Djava.net.preferIPv6Addresses=false'
export M2_HOME=/usr/local/opt/maven/libexec
export GRADLE_HOME=/usr/local/opt/gradle/libexec
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export CATALINA_HOME=/usr/local/opt/tomcat/libexec
export GOROOT=/usr/local/opt/go/libexec
export GOPATH="$HOME/go"
export PATH="$(/usr/local/bin/brew --prefix coreutils)/libexec/gnubin:$HOME/bin:$PATH:/usr/local/sbin:$HOME/.jenv/bin:$GOPATH/bin:$GOROOT/bin"
export MANPATH="$(/usr/local/bin/brew --prefix coreutils)/libexec/gnuman:$MANPATH"
export SHELL=/usr/local/bin/bash
export VISUAL=vim
export EDITOR="$VISUAL"
export PKG_CONFIG_PATH='/usr/local/opt/libxml2/lib/pkgconfig pkg-config --cflags glib-2.0 libcurl libxml-2.0 sqlite3'

# NeoVim
if type nvim > /dev/null 2>&1; then
  export VISUAL=/usr/local/bin/nvim
  export EDITOR="$VISUAL"
  export VIMCONFIG="$HOME/.config/nvim"
  export VIMDATA="$HOME/.local/share/nvim"
  export MYVIMRC="$VIMCONFIG/init.vim"
fi

# Git
export GIT_PS1_SHOWDIRTYSTATE=1

# My environment variables
export dev="$HOME/Development"
export sicp="$dev/SICP/sicp"

# pull in Enterprise stuff
[[ -f ~/.bash_enterprise ]] && source ~/.bash_enterprise

# source .bashrc
[[ -f ~/.bashrc ]] && source ~/.bashrc
