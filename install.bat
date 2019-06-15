@echo off


set userdir=%USERPROFILE%
set userConfig=%USERPROFILE%/\_vimrc
set backupConfig=%USERPROFILE%/\_vimrc.bkp
set vimrcfile=vimrc
set minVimrcfile=minimal-vimrc
set nanoVimrcfile=nano-vimrc

if exist %backupConfig% (
    del "%backupConfig%"
)
if exist %userConfig% (
    copy /y  "%userConfig%" "%backupConfig%"
)

if "%1" == "/m" (
    echo "Installing minimal vimrc file.."
    copy /y "%minVimrcfile%" "%userConfig%"
) else (
    if "%1" == "/n" (
        echo "Installing nano vimrc file.."
        copy /y "%nanoVimrcfile%" "%userConfig%"
    ) else (
        echo "Installing vimrc file.."
        copy /y "%vimrcfile%" "%userConfig%"
    )
)

echo "Done!"
