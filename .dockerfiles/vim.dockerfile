FROM ghcr.io/mogeko/bash

ARG VIMRC=https://raw.githubusercontent.com/mogeko/dotfiles/master/vim/.vimrc
ARG VIM_PLUG=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ADD --chown=1000:100 $VIMRC /home/$USER/.vimrc
ADD --chown=1000:100 $VIM_PLUG /home/$USER/.vim/autoload/plug.vim

RUN apk add --no-cache git vim

ENTRYPOINT su-exec $USER:users /bin/bash
