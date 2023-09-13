#
# ~/.zshrc.d/53-setup-orbstack.zsh
#

# Setup the development environment of OrbStack
if [[ -f "${HOME}/.orbstack/shell/init.zsh" ]]; then
  source "${HOME}/.orbstack/shell/init.zsh" 2>/dev/null || :
fi
