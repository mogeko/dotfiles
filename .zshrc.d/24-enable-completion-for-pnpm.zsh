#
# ~/.zshrc.d/24-enable-completion-for-pnpm.zsh
#

# Enable completion for pnpm
if [[ -f "${HOME}/.config/tabtab/zsh/pnpm.zsh" ]]; then
  source "${HOME}/.config/tabtab/zsh/pnpm.zsh"
fi
