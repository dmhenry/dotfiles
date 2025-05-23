eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$(brew --prefix coreutils)/libexec/gnubin:${HOME}/bin:${PATH}"
export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:${MANPATH}"
export SHELL="$(brew --prefix)/bin/bash"

set -o noclobber      # do not overwrite existing files with >
shopt -s autocd       # cd into paths on the command line 
shopt -s cdable_vars  # treat non-directory cd arguments as variables

alias ll="command ls --color=auto -ahlF $@"

export VISUAL=vim
export EDITOR="${VISUAL}"
export BASHRC="${HOME}/.bashrc"

# Bash completion
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] &&
    source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
[[ -r "$(brew --prefix)/etc/bash_completion" ]] &&
    source "$(brew --prefix)/etc/bash_completion"

# Neovim
# curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
#
if [ -x "$(command -v nvim)" ]; then
    export VISUAL=nvim
    export EDITOR="${VISUAL}"
    export VIMCONFIG="${HOME}/.config/nvim"
    export VIMDATA="${HOME}/.local/share/nvim"
    export MYVIMRC="${VIMCONFIG}/init.vim"
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

# Ruby
if [ -x "$(command -v rbenv)" ]; then
    eval "$(rbenv init - bash)"
fi

if [ -x "$(command -v starship)" ]; then
    eval "$(starship init bash)"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

