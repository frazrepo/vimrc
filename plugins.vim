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
Plug 'w0rp/ale', { 'on' : 'ALEToggle' }

" Code Editing
Plug 'AndrewRadev/splitjoin.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'matze/vim-move'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'maralla/completor.vim'


" Code Editing assist - Text Objects
Plug 'beloglazov/vim-textobj-quotes'
Plug 'glts/vim-textobj-comment'
Plug 'jceb/vim-textobj-uri'
Plug 'kana/vim-textobj-user'
Plug 'michaeljsmith/vim-indent-object'
Plug 'zirrostig/vim-schlepp'

" Code Searching
Plug 'mileszs/ack.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-abolish'
Plug 'justinmk/vim-sneak'
Plug 'frazrepo/yankmatches'


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