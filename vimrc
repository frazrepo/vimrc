
" For Vim Plug autoload and plugins
set rtp+=$HOME/.vim_runtime

" Custom documentations
set rtp+=$HOME/.vim_runtime/vim-docs/

" Plugins
source $HOME/.vim_runtime/plugins.vim
source $HOME/.vim_runtime/basic.vim
source $HOME/.vim_runtime/plugins_config.vim

" Others Windows common stuff , map ctrl+c, ctrl+v, ctrl+f,...
" Comment if you do not want this 
source $HOME/.vim_runtime/mswin.vim

" Menu
source $HOME/.vim_runtime/menu.vim

" Host specific vim 
if filereadable(expand($HOME . '/.vimlocal'))
    source $HOME/.vimlocal
endif
