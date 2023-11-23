#!/bin/sh

ln -sf /home/riq0h/dotfiles/.svzshrc ~/.zshrc
mkdir .config
mkdir .config/nvim
ln -sf /home/riq0h/dotfiles/init.lua ~/.config/nvim/init.lua
ln -sf /home/riq0h/dotfiles/.zpreztorc ~/.zpreztorc
ln -sf /home/riq0h/.zprezto ~/.zprezto
