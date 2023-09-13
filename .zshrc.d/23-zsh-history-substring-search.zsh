#
# ~/.zshrc.d/23-zsh-history-substring-search.zsh
#

# Setup zsh-history-substring-search
if type brew &>/dev/null; then
  source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

  # Set configuration
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi
