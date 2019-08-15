@echo off


set userdir=%USERPROFILE%
set userConfig=%USERPROFILE%/\_vimrc
set backupConfig=%USERPROFILE%/\_vimrc.bkp
set vimrcfile=vimrc
set lightvimrc=lightvimrc.vim
set minivimrc=minivimrc.vim

if exist %backupConfig% (
    del "%backupConfig%"
)
if exist %userConfig% (
    copy /y  "%userConfig%" "%backupConfig%"
)

if "%1" == "/l" goto lightvimrc
if "%1" == "/m" goto minivimrc

echo "Installing vimrc file.."
copy /y "%vimrcfile%" "%userConfig%"
goto exit

:lightvimrc
echo "Installing light vimrc file.."
copy /y "%lightvimrc%" "%userConfig%"
goto exit

:minivimrc
echo "Installing mini vimrc file.."
copy /y "%minivimrc%" "%userConfig%"
goto exit

:exit
echo "Done!"
