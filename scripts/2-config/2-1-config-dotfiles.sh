#!/bin/bash

ln -s $HOME/setup/.config $HOME/.config
ln -s $HOME/setup/.gitconfig $HOME/.gitconfig
ln -s $HOME/setup/.zshrc $HOME/.zshrc

exec zsh

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim --headless +PlugInstall +qa

cargo install tmux-sessionizer
fish
fish_add_path /Users/thomas-delalande/.cargo/bin
tms config -p ~/dev

