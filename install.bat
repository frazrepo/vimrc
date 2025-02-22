@echo off


set userdir=%USERPROFILE%
set userConfig=%USERPROFILE%/\_vimrc
set backupConfig=%USERPROFILE%/\_vimrc.bkp
set vimrcfile=vimrc
set lightvimrc=lightvimrc.vim

if exist %backupConfig% (
    del "%backupConfig%"
)
if exist %userConfig% (
    copy /y  "%userConfig%" "%backupConfig%"
)

if "%1" == "/l" goto lightvimrc

echo "Installing vimrc file.."
copy /y "%vimrcfile%" "%userConfig%"
goto exit

:lightvimrc
echo "Installing light vimrc file.."
copy /y "%lightvimrc%" "%userConfig%"
goto exit

:exit
echo "Done!"
