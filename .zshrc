#
# ~/.zshrc
#

# We put default configurations in `~/.zshrc.d/00-default.zsh` file.

# Any files in `~/.zshrc.d/` directory will be seen as configuration files,
# and will be sourced in alphabetical order automatically. You can put your
# own configurations in this directory.
#
# For the sake of maintainability, we recommend you change the settings
# by overriding the upstream settings in your own configuration files,
# instead of changing the upstream. As a convention, we use a number prefix
# to indicate the order of the files, e.g. `00-default.zsh`. And we recommend
# your own configuration files prefixed with a number during fllowing rules:
#
# - 01-19: common settings
# - 20-49: zsh plugins and completions
# - 50-89: environment variables
#
if [[ -d "${HOME}/.zshrc.d" ]]; then
  for __rc in "${HOME}/.zshrc.d"/*; do
    if [[ -f "${__rc}" ]]; then
      source "${__rc}"
    fi
  done
fi
unset __rc
