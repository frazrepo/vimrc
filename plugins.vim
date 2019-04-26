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

" Code Editing {{{1
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/Transpose', { 'on': ['Transpose','TransposeWords','TransposeCSV','TransposeTab','TransposeInteractive']}

" Text Objects, Motions and Operators {{{1
Plug 'coderifous/textobj-word-column.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'
Plug 'matze/vim-move'
Plug 'zirrostig/vim-schlepp'
Plug 'tommcdo/vim-exchange'
Plug 'vim-scripts/ReplaceWithRegister'

" Code Searching {{{1
Plug 'dyng/ctrlsf.vim', { 'on': ['CtrlSF']}
Plug 'tpope/vim-abolish'
Plug 'frazrepo/vim-yankmatches'
Plug 'osyo-manga/vim-over'
Plug 'unblevable/quick-scope'
Plug 'haya14busa/incsearch.vim'

" Code formatting {{{1
Plug 'tommcdo/vim-lion'

" Sorting {{{1
Plug 'christoomey/vim-sort-motion'

" Visual Comfort - Color Schemes {{{1
Plug 'frazrepo/vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'frazrepo/vim-rainbow', { 'on' : 'RainbowToggle' }
Plug 'kshenoy/vim-signature'
Plug 'machakann/vim-highlightedyank'
Plug 'frazrepo/vim-rotatescheme'

" Git integration {{{1
Plug 'tpope/vim-fugitive'

" File management, searching {{{1
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'airblade/vim-rooter'
Plug 'justinmk/vim-dirvish'
Plug 'vim-scripts/LargeFile'
Plug 'justinmk/vim-gtfo'
Plug 'romainl/vim-qlist'

" Snippet -  Code Generation - AutoCompletion {{{1
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'mattn/emmet-vim' , { 'for':  ['html', 'css']}
Plug 'tpope/vim-commentary'
Plug 'maralla/completor.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"  Zen Mode for writing text {{{1
Plug 'junegunn/goyo.vim', { 'for' : 'markdown' }
Plug 'amix/vim-zenroom2', { 'for' : 'markdown' }

" Languages {{{1
Plug 'sheerun/vim-polyglot'

" Undo
Plug 'mbbill/undotree', { 'on' : 'UndotreeToggle' }

"Code navigation {{{1
" On Linux do a chmod +x ./plat/update_tags.sh
" Install ctags for host OS 
if executable('ctags')
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'majutsushi/tagbar'
endif
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugs End 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Modeline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: fdm=marker
