@echo off

echo "Installing frazrepo/vimrc configuration...."

git clone --depth=1 https://github.com/frazrepo/vimrc.git ~/.vim_runtime

echo "Done!"

REM copy ~/.vim_runtime/.vimrc ~/.vim_runtime/_vimrc