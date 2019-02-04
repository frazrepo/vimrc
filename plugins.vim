"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       frazrepo
"       https://github.com/frazrepo/vimrc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle plugins declaration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim_runtime/plugins')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugs Start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Dependencies
Plug 'w0rp/ale'
Plug 'xolox/vim-misc'

" Code Editing
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'mg979/vim-visual-multi'
Plug 'ervandew/supertab'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'jiangmiao/auto-pairs'


" Code Editing assist - Text Objects
Plug 'kana/vim-textobj-user'
Plug 'jceb/vim-textobj-uri'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'glts/vim-textobj-comment'
Plug 'michaeljsmith/vim-indent-object'

" Code Searching
Plug 'mileszs/ack.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-abolish'


" Code formatting
Plug 'Chiel92/vim-autoformat'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/SQLUtilities'


" Sorting
Plug 'christoomey/vim-sort-motion'

" Visual Comfort - Color Schemes
Plug 'dracula/vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'gosukiwi/vim-atom-dark'
Plug 'liuchengxu/vim-which-key'
Plug 'kshenoy/vim-signature'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'machakann/vim-highlightedyank'

" Todo : Tmux integration - Uncomment for linux
" Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'

" Git integration
Plug 'tpope/vim-fugitive'

" File management, searching
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'yegappan/mru'
Plug 'scrooloose/nerdtree'

" Notes, markdown, wiki
" Should be declared after tabular plugin
Plug 'plasticboy/vim-markdown'

" Snippet Code Generation
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Session management
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'artnez/vim-wipeout'

"  Zen Mode for writing text
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'

" Language
Plug 'PProvost/vim-ps1.git'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugs End
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()