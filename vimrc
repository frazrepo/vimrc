
set rtp+=$HOME/.vim_runtime

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim_runtime/plugins/Vundle.vim/

" Custom documentations
set rtp+=$HOME/.vim_runtime/vim-docs/


source $HOME/.vim_runtime/plugins.vim
source $HOME/.vim_runtime/basic.vim
source $HOME/.vim_runtime/plugins_config.vim

" Others Windows common stuff , map ctrl+c, ctrl+v, ctrl+f,...
" Comment if you do not want this 
source $HOME/.vim_runtime/mswin.vim

