"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       frazrepo
"       https://github.com/frazrepo/vimrc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Native Vim Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
packadd! matchit

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
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/Transpose'
Plug 'frazrepo/vim-yankring'

" Text Objects, Motions and Operators
Plug 'glts/vim-textobj-comment'
Plug 'jceb/vim-textobj-uri'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'
Plug 'matze/vim-move'
Plug 'zirrostig/vim-schlepp'
Plug 'tommcdo/vim-exchange'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'

" Code Searching
Plug 'mileszs/ack.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-abolish'
Plug 'justinmk/vim-sneak'
Plug 'frazrepo/yankmatches'
Plug 'osyo-manga/vim-over'

" Code formatting
" Requires external formatter for each language
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
Plug 'gilgigilgil/anderson.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'kshenoy/vim-signature'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'machakann/vim-highlightedyank'

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" File management, searching
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'scrooloose/nerdtree' , { 'on': 'NERDTreeToggle'}
Plug 'vim-scripts/LargeFile'

" Snippet -  Code Generation - AutoCompletion
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'maralla/completor.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Session management
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'artnez/vim-wipeout'
Plug 'frazrepo/vim-autosave'

"  Zen Mode for writing text
Plug 'junegunn/goyo.vim', { 'for' : 'markdown' }
Plug 'amix/vim-zenroom2', { 'for' : 'markdown' }

" Languages
Plug 'sheerun/vim-polyglot'

" Miscellaneous
Plug 'takac/vim-hardtime'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugs End
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()
