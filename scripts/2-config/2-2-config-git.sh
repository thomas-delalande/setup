#!/bin/bash

ssh-keygen -t ed25519 -C "80664757+thomas-delalande@users.noreply.github.com" 

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

