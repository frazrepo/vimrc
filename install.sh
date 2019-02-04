#!/bin/bash

vimPlugRuntime=~/.vim/autoload/plug.vim
vimPlugRuntimeSource=./autoload/plug.vim
echo "Installing vim plug runtime .."
[ ! -e $vimPlugRuntime ] &&  cp  $vimPlugRuntimeSource $vimPlugRuntime

echo "Installing vimrc file.."
userdir=~
userConfig=$userdir/.vimrc
backupConfig=~/.vimrc.bkp
vimrcfile=vimrc

[ -e $backupConfig ] &&  rm $backupConfig

if [ $userConfig ]; then
    cp  $userConfig $backupConfig
fi

cp  $vimrcfile $userConfig

echo "Done!"
