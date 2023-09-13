#
# ~/.zshrc.d/52-setup-cargo.sh
#

# Setup the development environment of Rust
if [[ -f "${HOME}/.cargo/env" ]]; then
  source "${HOME}/.cargo/env" 2>/dev/null || :
fi
