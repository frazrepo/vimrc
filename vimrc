
" For Vim Plug autoload and plugins
set rtp+=$HOME/.vim_runtime

" Custom documentations
set rtp+=$HOME/.vim_runtime/doc/

" Plugins
source $HOME/.vim_runtime/plugins.vim
source $HOME/.vim_runtime/basic.vim
source $HOME/.vim_runtime/plugins_config.vim

" Host specific vim 
if filereadable(expand($HOME . '/.vimrc.local'))
    source $HOME/.vimrc.local
endif
