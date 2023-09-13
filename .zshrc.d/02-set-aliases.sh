#
# ~/.zshrc.d/02-set-aliases.sh
#

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
if [[ -f "${HOME}/.bash_aliases" ]]; then
  source "${HOME}/.bash_aliases"
fi

# User alias
alias ..='cd ..'
alias cls='clear'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
alias nowtime='now'
alias path='echo -e ${PATH//:/\\n}'
alias ping='ping -c 5'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias myip='ifconfig | grep -P "inet 192.168.(\d+.){2}" | cut -d " " -f 2'
alias targz='tar -czvf'
alias getpass='openssl rand -base64 20'
alias stopwatch='time'
