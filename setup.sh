#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  _OS_NAME="darwin"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  _OS_NAME="linux"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
  _OS_NAME="windows"
fi

echo -e "\nThe current operating system is: ${_OS_NAME}.\n"

# Install dotfiles
echo "Installing dotfiles..."
if [ "${_OS_NAME}" == "darwin" ]; then
  install -v -m 0644 "./bash/macos.bash_profile" "${HOME}/.bash_profile"
  install -v -m 0644 "./bash/macos.bash_aliases" "${HOME}/.bash_aliases"
  # Install Homebrew
  if [ -f "/opt/homebrew/bin/brew" ]; then
    echo -e "\nHomebrew is already installed.\n"
  else
    echo -e "\nInstalling Homebrew...\n"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
elif [ "${_OS_NAME}" == "linux" ]; then
  install -v -m 0644 "./bash/linux.bashrc" "${HOME}/.bashrc"
  install -v -m 0644 "./bash/linux.bash_aliases" "${HOME}/.bash_aliases"
fi
