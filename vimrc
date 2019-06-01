
" For Vim Plug autoload and plugins
set rtp+=$HOME/.vim_runtime

" Custom documentations
set rtp+=$HOME/.vim_runtime/doc/

" Scripts
source $HOME/.vim_runtime/basic.vim

" Host specific vim 
if filereadable(expand($HOME . '/.vimrc.local'))
    source $HOME/.vimrc.local
endif
