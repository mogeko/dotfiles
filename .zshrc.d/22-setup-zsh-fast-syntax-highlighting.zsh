#
# ~/.zshrc.d/22-setup-zsh-fast-syntax-highlighting.zsh
#

# Setup zsh-fast-syntax-highlighting
if type brew &>/dev/null; then
  source $(brew --prefix)/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fi
