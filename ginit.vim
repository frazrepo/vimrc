" Linux
if has('win32') || has('win64')
    :GuiFont! Consolas:h15
else
    :Guifont Inconsolata:h16
endif

"Maximized
call GuiWindowMaximized(1)

" Make popup nice on Windows
GuiPopupmenu 0
