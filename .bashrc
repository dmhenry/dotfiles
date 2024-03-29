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

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

eval "$(starship init bash)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"
