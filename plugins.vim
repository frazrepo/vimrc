"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:frazrepo
" https://github.com/frazrepo/vimrc
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
Plug 'dyng/ctrlsf.vim' , { 'on' : ['CtrlSF', '<Plug>CtrlSFPrompt', '<Plug>CtrlSFVwordExec','<Plug>CtrlSFVwordPath']}
Plug 'tpope/vim-abolish'
Plug 'frazrepo/vim-yankmatches'
Plug 'osyo-manga/vim-over'

" Code formatting {{{1
Plug 'tommcdo/vim-lion'                             "Not lazy loadable

" Sorting {{{1
Plug 'christoomey/vim-sort-motion'

" Visual Comfort - Color Schemes {{{1
Plug 'frazrepo/vim-colorschemes'
Plug 'frazrepo/vim-rotatescheme'
Plug 'itchyny/lightline.vim'
Plug 'frazrepo/vim-rainbow', { 'on' : 'RainbowToggle' }
Plug 'machakann/vim-highlightedyank'

" Git integration {{{1
Plug 'tpope/vim-fugitive'

" File management, searching, quickfix {{{1
Plug 'Yggdroot/LeaderF'
Plug 'airblade/vim-rooter'
Plug 'justinmk/vim-dirvish'                             "Not lazy loadable
Plug 'justinmk/vim-gtfo'
Plug 'romainl/vim-qlist'
Plug 'romainl/vim-qf'

" Snippet -  Code Generation - AutoCompletion {{{1
Plug 'machakann/vim-sandwich'
Plug 'mattn/emmet-vim' , { 'for':  ['html', 'css']}
Plug 'tpope/vim-commentary'
if !has('nvim') 
    Plug 'maralla/completor.vim'
    Plug 'tmsvg/pear-tree'
else
    "Use coc for nvim
    if has('win32') || has('win64')
        Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.cmd'}
    else
        Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
    endif
endif
Plug 'SirVer/ultisnips'                                 " Python plugins are too slow on nvim windows
Plug 'honza/vim-snippets'                               " Python plugins are too slow on nvim windows

" Languages - Formatters {{{1
Plug 'sheerun/vim-polyglot'
Plug 'sbdchd/neoformat', { 'on' : 'Neoformat'}

" Undo
Plug 'mbbill/undotree', { 'on' : 'UndotreeToggle' }

" Scratch (Experimental)
Plug 'frazrepo/scratch', { 'on' : 'Scratch'}

"Code navigation {{{1
" On Linux do a chmod +x ./plat/update_tags.sh
" Install ctags for host OS 
if executable('ctags')
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'majutsushi/tagbar' , { 'on' : 'TagbarToggle'}
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
