#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  _OS_NAME="darwin"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  _OS_NAME="linux"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
  _OS_NAME="windows"
fi

echo -e "\nThe current operating system is: ${_OS_NAME}.\n"

# Download plug.vim
echo "Downloading plug.vim to ./tmp/plug.vim ..."
echo "See https://github.com/junegunn/vim-plug."
curl -fLo "./tmp/plug.vim" --create-dirs \
  "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
echo -e "Done.\n"

# install dotfiles
echo "Installing dotfiles..."
if [ "${_OS_NAME}" == "darwin" ]; then
  install -v -m 0644 "./bash/macos.bash_profile" "${HOME}/.bash_profile"
  install -v -m 0644 "./bash/macos.bash_aliases" "${HOME}/.bash_aliases"
elif [ "${_OS_NAME}" == "linux" ]; then
  install -v -m 0644 "./bash/linux.bashrc" "${HOME}/.bash_profile"
  install -v -m 0644 "./bash/linux.bash_aliases" "${HOME}/.bash_aliases"
fi

install -v -m 0644 "./git/.gitconfig" "${HOME}/.gitconfig"
install -v -m 0644 "./tmp/plug.vim" "${HOME}/.vim/autoload/plug.vim"
install -v -m 0644 "./vim/.vimrc" "${HOME}/.vimrc"
