#!/bin/bash

ssh-keygen -t id_rsa -C "80664757+thomas-delalande@users.noreply.github.com" 

ln -s $HOME/setup/config $HOME/.ssh/config

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

