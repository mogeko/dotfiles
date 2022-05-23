# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/bash_profile.pre.bash"

# >>> homebrew initialize >>>
# Setup homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
# <<< homebrew initialize <<<

# Disable default Shell warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, allow to enter directory without using cd command.
shopt -s autocd

# Check the spelling of the directory name in the cd command.
# Only for interactive shell
shopt -s cdspell

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# Enable color support
export CLICOLOR=1
export LSCOLORS='ExGxFxdaCxDaDahbadeche'
# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

alias grep='ggrep --color=auto'
alias fgrep='gfgrep --color=auto'
alias egrep='gegrep --color=auto'

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
if [[ -f "${HOME}/.bash_aliases" ]]; then
  source "${HOME}/.bash_aliases"
fi

# PS1
PS1='\[\e[38;5;046m\][\[\e[38;5;226m\]\t \[\e[38;5;197m\]\w\[\e[38;5;046m\]]\$\[\e[m\] '

# >>> bash-completion initialize >>>
# Setup bash-completion
#if type brew &>/dev/null; then
#  HOMEBREW_PREFIX="$(brew --prefix)"
#  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
#    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
#  else
#    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
#      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
#    done
#  fi
#fi
# <<< bash-completion initialize <<<

# >>> shell integration initialize >>>
# Setup iTerm2 Shell Integration
if [[ -f "${HOME}/.iterm2/iterm2_shell_integration.bash" ]]; then
  source "${HOME}/.iterm2/iterm2_shell_integration.bash"
fi
# <<< shell integration initialize <<<

# >>> python initialize >>>
# Setup Python
#export PATH="$(brew --prefix)/opt/python/libexec/bin:$PATH"
# <<< python initialize <<<

# >>> conda initialize >>>
# Automatically activate the base environment during shell
export CONDA_AUTO_ACTIVATE_BASE=true
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/bash_profile.post.bash"
