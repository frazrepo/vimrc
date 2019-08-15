@echo off


set userdir=%USERPROFILE%
set userConfig=%USERPROFILE%/\_vimrc
set backupConfig=%USERPROFILE%/\_vimrc.bkp
set vimrcfile=vimrc
set minVimrcfile=lightvimrc.vim

if exist %backupConfig% (
    del "%backupConfig%"
)
if exist %userConfig% (
    copy /y  "%userConfig%" "%backupConfig%"
)

if "%1" == "/m" (
    echo "Installing light vimrc file.."
    copy /y "%minVimrcfile%" "%userConfig%"
) else (
        echo "Installing vimrc file.."
        copy /y "%vimrcfile%" "%userConfig%"
)

echo "Done!"
