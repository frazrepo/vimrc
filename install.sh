#!/bin/bash

echo "Installing vimrc file.."

userdir=~
userConfig=$userdir/.vimrc
backupConfig=~/.vimrc.bkp
vimrcfile=vimrc

if exist $backupConfig (
    rm $backupConfig
)
if exist $userConfig (
    echo "cp $userConfig $backupConfig ..."
    cp  $userConfig $backupConfig
)

cp /y $vimrcfile $userConfig

echo "Done!"