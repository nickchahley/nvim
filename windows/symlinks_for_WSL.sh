#!/bin/bash
# Wait. I can just deploy the config from git
# Symlinks to let windows neovim run on WSL. Run this from WSL

git clone https://nickchahley@github.com/nickchahley/nvim ~/.config/nvim

dir=$HOME/.local/share/nvim
if [[ ! -e $dir ]]; then
	mkdir -p $dir
fi

dir=$HOME/.vim-undobackswap
if [[ ! -e $dir ]]; then
	mkdir -p $dir
fi

dir=$HOME
src=/mnt/c/Users/nikoli/Dropbox/vimwiki
ln -s $src $dir 
