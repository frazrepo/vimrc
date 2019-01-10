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

" Code formatting
Plugin 'Chiel92/vim-autoformat'
Plugin 'godlygeek/tabular'

" Visual Comfort
Plugin 'dracula/vim'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'ryanoasis/vim-devicons'

" Tmux integration - Uncomment for linux
" Plugin 'edkolev/tmuxline.vim'
" Plugin 'christoomey/vim-tmux-navigator'

" Git integration
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'

" File management, searching
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'yegappan/mru'
Plugin 'scrooloose/nerdtree'

" Notes, markdown, wiki
Plugin 'xolox/vim-notes'
Plugin 'plasticboy/vim-markdown'
Plugin 'vimwiki/vimwiki'

" Snippet Code Generation
Plugin 'tpope/vim-surround'
" Requires python on windows
" Plugin 'SirVer/ultisnips' 
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-commentary'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins End
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vundle End
call vundle#end()
