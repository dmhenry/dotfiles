[[ -r "${HOME}/.bashrc" ]] && source "${HOME}/.bashrc"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/dave/.sdkman"
[[ -s "/Users/dave/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/dave/.sdkman/bin/sdkman-init.sh"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

