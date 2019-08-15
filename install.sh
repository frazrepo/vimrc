#!/bin/bash

option=$1
userdir=~
userConfig=$userdir/.vimrc
backupConfig=~/.vimrc.bkp
vimrcfile=vimrc
lightvimrc=lightvimrc.vim
minivimrc=minivimrc.vim

[ -e $backupConfig ] &&  rm $backupConfig

if [ $userConfig ]; then
    cp  $userConfig $backupConfig
fi

[ -z $option ] && option="full"

if [ $option == "-l" ]
then
    echo "Installing light vimrc file.."
    cp  $lightvimrc $userConfig
elif [ $option == "-m" ]
then
    echo "Installing mini vimrc file.."
    cp  $minivimrc $userConfig
elif [ $option == "full" ]
then
    echo "Installing vimrc file.."
    cp  $vimrcfile $userConfig
fi

echo "Done!"
