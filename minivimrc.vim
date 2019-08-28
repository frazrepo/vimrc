"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Minimal vimrc
" Maintainer: frazrepo
" https://github.com/frazrepo/vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

runtime macros/matchit.vim

set nocompatible                   " Set default to nocompatible
filetype plugin indent on          " Filetype support 
syntax on                          " Activate by default dracula theme

set autoindent                     " Auto indent
set backspace=eol,start,indent     " Configure backspace so it acts as it should act
set clipboard^=unnamed,unnamedplus " Default to system clipboard
set complete=.,w,b,u               " Complete option
set cpoptions+=>                   " Put a line break before appended text (appending to register)
set encoding=utf-8                 " Dealing with special chars
set expandtab                      " Use spaces instead of tabs

set foldlevelstart=99 
set foldmethod=indent              " Foldmethod indent
set gdefault
set hidden                         " A buffer becomes hidden when it is abandoned
set hlsearch                       " Highlight search results
set ignorecase                     " Ignore case when searching
set incsearch                      " Makes search act like search in modern browsers
set lazyredraw                     " Don't redraw while executing macros (good performance config)
set listchars=eol:$,tab:»\ ,trail:.,extends:›,precedes:‹
set magic                          " For regular expressions turn magic on
set mouse=a                        " Activate mouse

set nobackup                       " Turn backup off, since most stuff is in SVN, git et.c anyway...
set nolist                         " List Chars
set noswapfile
set nowritebackup

set number                         " Number - No Default relative number (cause slowness)
set ruler
set shiftwidth=4                   " 1 tab == 4 spaces

set shortmess=atI                  " Disable startup message

set smartindent                    " Smart indent
set smartcase                      " When searching try to be smart about cases 
set smarttab                       " Be smart when using tabs ;)

set splitbelow                     " Split mode
set splitright

set tabstop=4

set virtualedit=block              " VirtualEdit block allow selection everywhere in visual block mode
set whichwrap+=<,>,h,l

set wildmenu                       " Turn on the Wild menu
set wildmode=full

" Maximized window on start and Font Size
if has("gui_running")

  "GuiOptions - Horizontal scrollbar
  set guioptions+=b

  if has("gui_gtk2") || has("gui_gtk3") 
    set lines=535 columns=1366
    set guifont=Inconsolata\ 17
  endif

  if has("gui_win32")
    autocmd GUIEnter * :simalt ~n
    set guifont=Consolas:h14:cANSI
  endif

endif

""""""""""""""""""""""""""""""
" => Mappings {{{1
""""""""""""""""""""""""""""""

" Space as a Leader key
let mapleader = "\<Space>" 

" Fast saving
nmap <leader>w :w!<cr>

" Use CTRL-S for saving, also in Insert mode
nnoremap <C-S>		     :update<CR>
inoremap <C-S>		<C-O>:update<CR>


" Map jk to ESC in insert mode
inoremap jk <Esc>

" Search using magic regex
nnoremap / /\v
nnoremap ? ?\v

" Search/Replace
nnoremap <leader>r :%s///g<Left><Left>

"Visual find and replace
nnoremap <Leader>fr :%s/
xnoremap <Leader>fr :<C-u>'<,'>s/

" Repeat . command in visual mode
vnoremap . :normal.<CR>

" Keep selection in select mode after shifting
" Indenting not working when the line starts with ##
vnoremap > >gv
vnoremap < <gv

" Reselect last insertext
nnoremap gV `[v`]

" Disable highlight when <space><space> is pressed
map <silent> <space><space> :noh<cr>

" Smart way to move between windows horizontally
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move faster vertically (paragraph motion)
nnoremap <c-j> }
nnoremap <c-k> {

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Close the current buffer
map <leader>! :bd!<cr>

" Useful mapping for managing  buffers
map <leader>bn :enew<cr>
map <leader>ba :bufdo bd<cr>
 
" Buffers navigation
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Backspace to navigate to alternate buffer
nnoremap <bs> <c-^>

" Edit quickly with the current buffer path
map <leader>e :edit <c-r>=expand("%:p:h")<cr>/

" Change word under cursor and dot repeat, really useful to edit quickly
nnoremap c* *Ncgn
nnoremap c# #NcgN

" Quick yanking to the end of the line
nnoremap Y y$

" Quick macro recording and replaying ,qq for recording, and Q for replaying
nnoremap Q @q
xnoremap Q :normal @q<cr>

" Indent/Format All documents using = or gq
nnoremap g= mmgg=G`m
nnoremap gQ mmgggqG`m

" Navigating quickfix (Experimental)
nnoremap <A-Down> :cnext<Cr>
nnoremap <A-Up> :cprevious<Cr>

" H and L Begin/End on homerow
map H ^
map L g_

"Quick beautiful paste hack
nnoremap "p vi""0p
nnoremap 'p vi'"0p
nnoremap (p vi("0p

" Paste from yank register 
xnoremap <leader>p "0p
nnoremap <leader>p "0p

"Paste quickly in insert mode
inoremap <C-r><C-r> <C-r>*

" Toogle gj gk and j k
nnoremap k gk
nnoremap j gj

nnoremap gj j 
nnoremap gk k 

"Map some keys for azerty keyboard
map ² . 

" Marks keepjumps 
nnoremap ' `

" Expand %% to current path in command line mode
cnoremap %% <C-R>=fnameescape(expand("%:p:h")) . '/'<CR>
cnoremap :: <C-R>=fnameescape(expand("%"))<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a txt, markdown scratch
map <leader>x :e ~/buffer.txt<cr>
map <leader>d :e ~/buffer.md<cr>
map <leader>s :e ~/buffer.sql<cr>

" Tab Completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" AutoCommands 
if has("autocmd")
    augroup AutoCommandsGroup
        autocmd!

        " Return to last edit position when opening files (You want this!)
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

        " AutoSave Scratch buffer
        autocmd InsertLeave,TextChanged buffer.* nested silent! update
        autocmd FocusGained,BufEnter,CursorHold buffer.* silent! checktime

        "Open automatically the Quickfix Window
        autocmd QuickFixCmdPost [^l]* cwindow

    augroup END
endif

"Cheap MRU files
nnoremap <leader>u :bro ol<CR>

"Cheap buffer switching
nnoremap <leader>, :ls<CR>:b<Space>

" Cheap ctrl+p (Warning : too slow on big project)
set path=.,**
nnoremap <C-p> :find *
nnoremap ,s :sfind *
nnoremap ,v :vert sfind *

" File Browser
map <leader>v :Vexplore %:p:h<cr>