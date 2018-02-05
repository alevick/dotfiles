#!/bin/bash

brew install cmake
brew install vim --with-override-system-vi
brew install macvim --with-override-system-vim

vim +PluginInstall +qall

~/.vim/bundle/YouCompleteMe/setup.py
