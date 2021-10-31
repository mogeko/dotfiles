FROM alpine:3

ARG USER=user
ENV USER=$USER
RUN adduser -D -u 1000 -G users $USER

ARG WORKSPACE=/workspace
RUN mkdir $WORKSPACE && chown 1000:100 $WORKSPACE
WORKDIR $WORKSPACE
VOLUME $WORKSPACE

ARG BASHRC=https://raw.githubusercontent.com/mogeko/dotfiles/master/bash/.bashrc
ARG BASH_ALIASES=https://raw.githubusercontent.com/mogeko/dotfiles/master/bash/docker.bash_aliases
ADD --chown=1000:100 $BASHRC /home/$USER/.bashrc
ADD --chown=1000:100 $BASH_ALIASES /home/$USER/.bash_aliases
RUN ln -s $WORKSPACE /home/$USER/workspace

RUN apk add --no-cache bash bash-completion su-exec

ENTRYPOINT su-exec $USER:users /bin/bash
