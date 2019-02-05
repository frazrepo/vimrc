"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       frazrepo
"       https://github.com/frazrepo/vimrc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Plug plugins declaration
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
Plug 'matze/vim-move'


" Code Editing assist - Text Objects
Plug 'kana/vim-textobj-user'
Plug 'jceb/vim-textobj-uri'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'glts/vim-textobj-comment'
Plug 'michaeljsmith/vim-indent-object'

" Code Searching
Plug 'mileszs/ack.vim'
Plug 'dyng/ctrlsf.vim', { 'on' : 'CtrlSF' }
Plug 'tpope/vim-abolish'


" Code formatting
Plug 'Chiel92/vim-autoformat'
Plug 'godlygeek/tabular'
" Requires pip install sqlparse or pip3 install sqlparse
Plug 'mpyatishev/vim-sqlformat', { 'for' : 'sql' }


" Sorting
Plug 'christoomey/vim-sort-motion'

" Visual Comfort - Color Schemes
Plug 'dracula/vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'frazrepo/vim-rainbow', { 'on' : 'RainbowToggle' }
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
Plug 'mhinz/vim-signify'


" File management, searching
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'yegappan/mru'
Plug 'scrooloose/nerdtree' , { 'on': 'NERDTreeToggle'}

" Notes, markdown, wiki
" Should be declared after tabular plugin
Plug 'plasticboy/vim-markdown' , { 'for' : 'markdown' }

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
Plug 'junegunn/goyo.vim', { 'for' : 'markdown' }
Plug 'amix/vim-zenroom2', { 'for' : 'markdown' }

" Languages
Plug 'PProvost/vim-ps1.git', { 'for' : 'ps1' } 
Plug 'honza/dockerfile.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugs End
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()