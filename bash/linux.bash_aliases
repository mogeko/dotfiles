#
# ~/.bash_aliases
#

# User alias
alias cls='clear'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
alias nowtime='now'
alias path='echo -e ${PATH//:/\\n}'
alias ping='ping -c 5'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias myip='ifconfig | grep -P "192.168.(\d+.){2}"'
alias targz='tar -czvf'

# Not compatible with busybox
alias rm='rm --preserve-root'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Dependency needed
# Need: openssl git wget htop hub
alias getpass='openssl rand -base64 20'
alias gc='git commit'
alias gco='git checkout'
alias bdm="git branch --merged | grep -v '*' | xargs -n 1 git branch -d"
alias wgetall='wget -r -np -nd'
#alias top='htop'
#alias git='hub'

# Functions
# Need: unlzma bunzip2 unrar gunzip unzip uncompress 7z unxz cabextract
extract() {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [[ -f "$1" ]]; then
      #NAME=${1%.*}
      #mkdir $NAME && cd $NAME
      case $1 in
        *.tar.bz2)   tar -xvjf $1    ;;
        *.tar.gz)    tar -xvzf $1    ;;
        *.tar.xz)    tar -xvJf $1    ;;
        *.lzma)      unlzma $1      ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x -ad $1 ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar -xvf $1     ;;
        *.tbz2)      tar -xvjf $1    ;;
        *.tgz)       tar -xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *.xz)        unxz $1        ;;
        *.exe)       cabextract $1  ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}

backup() { cp "$1"{,.bak};}

stopwatch() {
  START=`date +%s%N`;
  $1
  END=`date +%s%N`;
  time=$((END-START))
  echo "scale=4; $time / 1000000000" | bc
}
