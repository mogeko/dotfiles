#
# ~/.zshrc.d/21-setup-zsh-autosuggestions.zsh
#

# Setup Zsh Autosuggestions
if type brew &>/dev/null; then
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

  # Set configuration
  export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)
  export ZSH_AUTOSUGGEST_HISTORY_IGNORE=("cd *")
  export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
fi
