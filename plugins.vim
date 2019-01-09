"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       frazrepo
"       https://github.com/frazrepo/vimrc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle plugins declaration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Begin
call vundle#begin('$HOME/.vim_runtime/plugins/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins Start
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-commentary'
Plugin 'chrisbra/vim-autosave'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'dracula/vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'Chiel92/vim-autoformat'
Plugin 'yegappan/mru'
Plugin 'yuttie/comfortable-motion.vim'
" Plugins End

" Vundle End
call vundle#end()
