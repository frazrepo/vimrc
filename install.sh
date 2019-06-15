#!/bin/bash

option=$1
userdir=~
userConfig=$userdir/.vimrc
backupConfig=~/.vimrc.bkp
vimrcfile=vimrc
minVimrcfile=minimal-vimrc
nanoVimrcfile=nano-vimrc

[ -e $backupConfig ] &&  rm $backupConfig

if [ $userConfig ]; then
    cp  $userConfig $backupConfig
fi

[ -z $option ] && option="full"

if [ $option == "-m" ]
then
    echo "Installing minimal vimrc file.."
    cp  $minVimrcfile $userConfig
fi

if [ $option == "-n" ]
then
    echo "Installing nano vimrc file.."
    cp  $nanoVimrcfile $userConfig
else
    echo "Installing vimrc file.."
    cp  $vimrcfile $userConfig
fi

echo "Done!"
