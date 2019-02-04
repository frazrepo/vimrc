@echo off

set vimPlugRuntime=%USERPROFILE%/.vim/autoload/plug.vim
set vimPlugRuntimeSource=./autoload/plug.vim
echo "Installing vim plug runtime .."

if not exist %vimPlugRuntime% (
    copy /y  "%vimPlugRuntimeSource%" "%vimPlugRuntime%"
)

echo "Installing vimrc file.."

set userdir=%USERPROFILE%
set userConfig=%USERPROFILE%/\_vimrc
set backupConfig=%USERPROFILE%/\_vimrc.bkp
set vimrcfile=vimrc

if exist %backupConfig% (
    del "%backupConfig%"
)
if exist %userConfig% (
    copy /y  "%userConfig%" "%backupConfig%"
)

copy /y "%vimrcfile%" "%userConfig%"

echo "Done!"