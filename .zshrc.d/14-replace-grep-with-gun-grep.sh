#
# ~/.zshrc.d/14-replace-grep-with-gun-grep.sh
#

# Replace Unix Grep with GNU Grep
# It seems that Gun Grep installed by Homebrew will automatically
# add the prefix `g`, so we use `alias` as `grep` here, which is
# an alias to replace the Unix Grep that comes with the system.
alias grep='ggrep --color=auto'
alias fgrep='gfgrep --color=auto'
alias egrep='gegrep --color=auto'

# Gnu Grep: https://www.gnu.org/software/grep
