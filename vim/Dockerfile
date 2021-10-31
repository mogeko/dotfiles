FROM alpine:3

ARG USER=editor
ARG VIMRC=https://raw.githubusercontent.com/mogeko/dotfiles/master/vim/.vimrc
ARG VIM_PLUG=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN apk add --no-cache bash git vim

RUN adduser -D -G users -u 1000 $USER
USER $USER:100

ADD --chown=1000:100 $VIMRC /home/$USER/.vimrc
ADD --chown=1000:100 $VIM_PLUG /home/$USER/.vim/autoload/plug.vim

WORKDIR /workspace

VOLUME ["/workspace"]

ENTRYPOINT ["/bin/bash"]
