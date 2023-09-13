#
# ~/.zshrc.d/20-setup-zsh-completions.zsh
#

# Setup Zsh Completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit && compinit

  # Set Configurations
  # Ignore case when matching Completion (lowercase matches uppercase)
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  # Ignore specific patterns (`help` or `h`) in Completion
  zstyle ':completion:*:*:help:*:*' ignored-patterns '*'
  # Separate man-pages sections
  zstyle ':completion:*:manuals' separate-sections true
  # Insert sections for man-pages
  zstyle ':completion:*:manuals.*' insert-sections true
fi
