#
# ~/.zshrc.d/01-enable-homebrew.sh
#

# Setup Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Configure Homebrew
# Print hints about changing Homebrew´s behaviour with environment variables.
# export HOMEBREW_NO_ENV_HINTS=true
# Set the version of Homebrew to the latest stable version.
export HOMEBREW_UPDATE_TO_TAG=true
# If set, `brew install`, `brew upgrade` and `brew reinstall` will never
# automatically cleanup installed/upgraded/reinstalled formulae.
# export HOMEBREW_NO_INSTALL_CLEANUP=true
# `brew cleanup` will start running `brew autoremove` periodically.
export HOMEBREW_AUTOREMOVE=true
