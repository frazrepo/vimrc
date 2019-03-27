"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       frazrepo
"       https://github.com/frazrepo/vimrc
"
" Remarks : Plugins prefixed with frazrepo may contains custom modifications (bug fixes,..)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Native Vim Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has("nvim")
    packadd! matchit
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Plug plugins declaration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim_runtime/plugins')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugs Start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Dependencies {{{1
Plug 'w0rp/ale', { 'on' : 'ALEToggle' }

" Code Editing {{{1
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/Transpose'
Plug 'frazrepo/vim-yankstack'

" Text Objects, Motions and Operators {{{1
Plug 'jceb/vim-textobj-uri'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'coderifous/textobj-word-column.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'
Plug 'matze/vim-move'
Plug 'zirrostig/vim-schlepp'
Plug 'tommcdo/vim-exchange'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'

" Code Searching {{{1
Plug 'mileszs/ack.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-abolish'
Plug 'frazrepo/vim-yankmatches'
Plug 'osyo-manga/vim-over'
Plug 'unblevable/quick-scope'

" Code formatting {{{1
" Requires external formatter for each language
Plug 'Chiel92/vim-autoformat'
Plug 'tommcdo/vim-lion'
" Requires pip install sqlparse or pip3 install sqlparse
Plug 'mpyatishev/vim-sqlformat', { 'for' : 'sql' }

" Sorting {{{1
Plug 'christoomey/vim-sort-motion'

" Visual Comfort - Color Schemes {{{1
Plug 'frazrepo/vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'frazrepo/vim-rainbow', { 'on' : 'RainbowToggle' }
Plug 'kshenoy/vim-signature'
Plug 'machakann/vim-highlightedyank'
Plug 'romainl/vim-cool'
Plug 'frazrepo/vim-rotatescheme'

" Git integration {{{1
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" File management, searching {{{1
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'scrooloose/nerdtree' , { 'on': 'NERDTreeToggle'}
Plug 'vim-scripts/LargeFile'
Plug 'justinmk/vim-gtfo'
Plug 'romainl/vim-qlist'

" Snippet -  Code Generation - AutoCompletion {{{1
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'maralla/completor.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Session management {{{1
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'artnez/vim-wipeout'
Plug 'frazrepo/vim-autosave'

"  Zen Mode for writing text {{{1
Plug 'junegunn/goyo.vim', { 'for' : 'markdown' }
Plug 'amix/vim-zenroom2', { 'for' : 'markdown' }

" Languages {{{1
Plug 'sheerun/vim-polyglot'

"Code navigation - Install ctags for host OS {{{1
" On Linux do a chmod +x /plat/update_tags.sh
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugs End 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Modeline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: fdm=marker