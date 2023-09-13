#
# ~/.zshrc.d/11-replace-cat-with-bat.sh
#

# Replace `cat` with `bat`
alias cat="bat --plain --paging=never"
alias less="bat --plain --paging=always"

# Set configuration
# Use `bat` as a colorizing pager for `man`.
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# Highlighting `--help` messages
function help() {
  "$@" --help 2>&1 | bat --plain --language=help
}
alias h='help'
