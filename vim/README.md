# .vimrc

Fork from [mogeko/.vimrc (gist)](https://gist.github.com/mogeko/291effaf70cce916ce8b1c2a964fcc0d).

Built-in [plug.vim](https://github.com/junegunn/vim-plug) support.

## Install

Open the terminal and run:

```
curl -fL -o ~/.vimrc -o ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/mogeko/dotfiles/master/{vimrc,vim/autoload/plug.vim}
```

For Archlinux:

```
sudo pacman -Syu vim-plug

curl -fLo ~/.vimrc --create-dirs https://raw.githubusercontent.com/mogeko/dotfiles/master/vimrc
```

Then open vim and execute `:PlugInstall`.
