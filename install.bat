@echo off

echo "Installing vimrc file.."

set userdir=%USERPROFILE%
set userConfig=%USERPROFILE%/\_vimrc
set backupConfig=%USERPROFILE%/\_vimrc.bkp
set vimrcfile=vimrc

if exist %backupConfig% (
    del "%backupConfig%"
)
if exist %userConfig% (
    echo "copy /y %userConfig% %backupConfig% ..."
    copy /y  "%userConfig%" "%backupConfig%"
)

copy /y "%vimrcfile%" "%userConfig%"

echo "Done!"