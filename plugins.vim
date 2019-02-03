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
Plugin 'xolox/vim-misc'

" Code Editing
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'mg979/vim-visual-multi'
Plugin 'ervandew/supertab'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'jiangmiao/auto-pairs'


" Code Editing assist - Text Objects
Plugin 'kana/vim-textobj-user'
Plugin 'jceb/vim-textobj-uri'
Plugin 'beloglazov/vim-textobj-quotes'
Plugin 'glts/vim-textobj-comment'
Plugin 'michaeljsmith/vim-indent-object'

" Code Searching
Plugin 'mileszs/ack.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'tpope/vim-abolish'


" Code formatting
Plugin 'Chiel92/vim-autoformat'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/SQLUtilities'


" Sorting
Plugin 'christoomey/vim-sort-motion'

" Visual Comfort - Color Schemes
Plugin 'dracula/vim'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'itchyny/lightline.vim'
Plugin 'frazrepo/vim-rainbow'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'liuchengxu/vim-which-key'
Plugin 'kshenoy/vim-signature'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'machakann/vim-highlightedyank'

" Todo : Tmux integration - Uncomment for linux
" Plugin 'edkolev/tmuxline.vim'
Plugin 'christoomey/vim-tmux-navigator'

" Git integration
Plugin 'tpope/vim-fugitive'

" File management, searching
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'yegappan/mru'
Plugin 'scrooloose/nerdtree'

" Notes, markdown, wiki
" Should be declared after tabular plugin
Plugin 'plasticboy/vim-markdown'

" Snippet Code Generation
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-commentary'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Session management
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'
Plugin 'artnez/vim-wipeout'

"  Zen Mode for writing text
Plugin 'junegunn/goyo.vim'
Plugin 'amix/vim-zenroom2'

" Language
Plugin 'PProvost/vim-ps1.git'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins End
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vundle End
call vundle#end()
