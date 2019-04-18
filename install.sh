#!/bin/bash

echo "Installing vimrc file.."
option=$1
userdir=~
userConfig=$userdir/.vimrc
backupConfig=~/.vimrc.bkp
vimrcfile=vimrc
minVimrcfile=minimal-vimrc

[ -e $backupConfig ] &&  rm $backupConfig

if [ $userConfig ]; then
    cp  $userConfig $backupConfig
fi
if [ $option = "m"] then
    cp  $minVimrcfile $userConfig
else
    cp  $vimrcfile $userConfig
fi

echo "Done!"
