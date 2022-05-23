#!/usr/bin/env bash

_PREFIX=${PREFIX:-$HOME}

if [ "$(uname)" == "Darwin" ]; then
  _OS_NAME="darwin"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  _OS_NAME="linux"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
  _OS_NAME="windows"
fi

echo -e "\nThe current operating system is: ${_OS_NAME}.\n"

# Install dotfiles
if [ "${_OS_NAME}" == "darwin" ]; then
  # Install Homebrew
  if [ -f "/opt/homebrew/bin/brew" ]; then
    echo -e "Homebrew is already installed.\n"
  else
    echo -e "Installing Homebrew...\n"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  echo -e "Installing dotfiles...\n"
  install -dvm 0755 "${_PREFIX}"
  install -Cvm 0644 "./bash/macos.bash_profile" "${_PREFIX}/.bash_profile"
  install -Cvm 0644 "./bash/macos.bash_aliases" "${_PREFIX}/.bash_aliases"
elif [ "${_OS_NAME}" == "linux" ]; then
  install -CDvm 0644 "./bash/linux.bashrc" "${_PREFIX}/.bashrc"
  install -CDvm 0644 "./bash/linux.bash_aliases" "${_PREFIX}/.bash_aliases"
fi

install -dvm 0755 "${_PREFIX}/.vim/autoload"
install -Cvm 0644 "./vim/autoload/plug.vim" "${_PREFIX}/.vim/autoload/plug.vim"
install -Cvm 0644 "./vimrc" "${_PREFIX}/.vimrc"
install -Cvm 0644 "./gitconfig" "${_PREFIX}/.gitconfig"
