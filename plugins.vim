"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:frazrepo
" https://github.com/frazrepo/vimrc
"
" Remarks : Plugins prefixed with frazrepo may contains custom modifications (bug fixes,..)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" AI completion engine
if has("gui_macvim")
  let g:ai_engine = 'codeium'
elseif has("gui_win32")
  let g:ai_engine = 'copilot'
else
  let g:ai_engine = 'copilot'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Native Vim Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has("nvim")
    packadd! matchit
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Plug plugins declaration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugs Start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Code Editing {{{1
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/Transpose', { 'on': ['Transpose','TransposeWords','TransposeCSV','TransposeTab','TransposeInteractive']}

" auto rename tags
Plug 'AndrewRadev/tagalong.vim'

" Text Objects, Motions and Operators {{{1
Plug 'coderifous/textobj-word-column.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'
Plug 'matze/vim-move'
Plug 'tommcdo/vim-exchange'
Plug 'vim-scripts/ReplaceWithRegister'

" Code Searching {{{1
Plug 'mhinz/vim-grepper'
Plug 'osyo-manga/vim-over'

" Code formatting {{{1
Plug 'tommcdo/vim-lion'                             "Not lazy loadable

" Sorting {{{1
Plug 'christoomey/vim-sort-motion'

" Visual Comfort - Color Schemes {{{1
Plug 'itchyny/lightline.vim'
Plug 'frazrepo/vim-rainbow', { 'on' : 'RainbowToggle' }
Plug 'machakann/vim-highlightedyank'
Plug 'ghifarit53/tokyonight-vim'

" Git integration {{{1
Plug 'tpope/vim-fugitive'

" File management, searching, quickfix {{{1
Plug 'Yggdroot/LeaderF'
Plug 'airblade/vim-rooter'
Plug 'justinmk/vim-gtfo'

" Snippet -  Code Generation - AutoCompletion {{{1
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'

" nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Use coc for nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Languages - Formatters {{{1
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim' , { 'for':  ['html', 'css']}
Plug 'sbdchd/neoformat', { 'on' : 'Neoformat'}

"AI engine
if g:ai_engine == 'copilot'
  Plug 'github/copilot.vim'
endif
if g:ai_engine == 'codeium'
  Plug 'Exafunction/codeium.vim'
endif

Plug 'liuchengxu/vim-which-key'

"}}}1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugs End 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Modeline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: fdm=marker
