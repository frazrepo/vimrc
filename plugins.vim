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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Dependencies
Plugin 'w0rp/ale'
Plugin 'chrisbra/vim-autosave'
Plugin 'xolox/vim-misc'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Code Editing
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'

" Code formatting
Plugin 'Chiel92/vim-autoformat'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/SQLUtilities'

" Visual Comfort
Plugin 'dracula/vim'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'frazrepo/vim-rainbow'

" Todo : Tmux integration - Uncomment for linux
" Plugin 'edkolev/tmuxline.vim'
" Plugin 'christoomey/vim-tmux-navigator'

" Git integration
Plugin 'tpope/vim-fugitive'

" File management, searching
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'yegappan/mru'
Plugin 'scrooloose/nerdtree'


" Notes, markdown, wiki
Plugin 'plasticboy/vim-markdown'

" Snippet Code Generation
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-commentary'

" Session management
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins End
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vundle End
call vundle#end()
