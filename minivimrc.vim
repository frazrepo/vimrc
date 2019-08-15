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
set autoread                       " Automatically reload file on change without asking
set backspace=eol,start,indent     " Configure backspace so it acts as it should act
set clipboard^=unnamed,unnamedplus " Default to system clipboard
set complete=.,w,b,u               " Complete option
set cpoptions+=>                   " Put a line break before appended text (appending to register)
set encoding=utf-8                 " Dealing with special chars
set expandtab                      " Use spaces instead of tabs

set foldlevelstart=99 
set foldmethod=manual              " Foldmethod manual
set formatoptions+=j               " Join option :  Delete comment character when joining commented lines
set gdefault
set hidden                         " A buffer becomes hidden when it is abandoned
set hlsearch                       " Highlight search results
set ignorecase                     " Ignore case when searching
set incsearch                      " Makes search act like search in modern browsers
set lazyredraw                     " Don't redraw while executing macros (good performance config)
set listchars=eol:$,tab:»\ ,trail:.,extends:›,precedes:‹
set magic                          " For regular expressions turn magic on
set matchpairs+=<:>                " Match pairs
set mouse=a                        " Activate mouse

set nobackup                       " Turn backup off, since most stuff is in SVN, git et.c anyway...
set noerrorbells
set nolist                         " List Chars
set noswapfile
set nowritebackup

set number                         " Number - No Default relative number (cause slowness)
set scrolloff=1                    " Set 1 lines to the cursor - when moving vertically using j/k
set shiftwidth=4                   " 1 tab == 4 spaces

set shortmess=atI                  " Disable startup message

set smartindent                    " Smart indent
set smartcase                      " When searching try to be smart about cases 
set smarttab                       " Be smart when using tabs ;)

set splitbelow                     " Split mode
set splitright

set tabstop=4

set virtualedit=block              " VirtualEdit block allow selection everywhere in visual block mode
set visualbell t_vb=               " No sound on errors
set whichwrap+=<,>,h,l

set wildmenu                       " Turn on the Wild menu
set wildmode=longest:full,full

""""""""""""""""""""""""""""""
" => Mappings {{{1
""""""""""""""""""""""""""""""

" Space as a Leader key
let mapleader = "\<Space>" 

" Fast saving
nmap <leader>w :w!<cr>

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

" Move faster vertically
nnoremap <c-j> 5j
nnoremap <c-k> 5k


" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Close the current buffer
map <leader>bd :bd<cr>
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
nnoremap cg* g*Ncgn
nnoremap cg# g#NcgN

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

" Use CTRL-S for saving, also in Insert mode
nnoremap <C-S>		     :update<CR>
inoremap <C-S>		<C-O>:update<CR>

" Do not track every j and k motion in jumplist  
nnoremap k gk
nnoremap j gj

" Toogle gj gk and j k
nnoremap gj j 
nnoremap gk k 

"Map some keys for azerty keyboard
map µ # 
map ² . 

" Marks keepjumps 
nnoremap mù m`
nnoremap ùù ``
nnoremap ' `

" Expand %% to current path in command line mode
cnoremap %% <C-R>=fnameescape(expand("%:p:h")) . '/'<CR>
cnoremap :: <C-R>=fnameescape(expand("%"))<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a txt, markdown and sql buffer for scribble
map <leader>x :e ~/buffer.txt<cr>
map <leader>d :e ~/buffer.md<cr>
map <leader>s :e ~/buffer.sql<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AutoCommands {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins Replacement for minimal vimrc {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim targets : 24 simple text-objects
" ----------------------
" i_ i. i: i, i; i| i/ i\ i* i+ i- i#
" a_ a. a: a, a; a| a/ a\ a* a+ a- a#
for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '-', '#' ]
	execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
	execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
	execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
	execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor

"Cheap MRU files
nnoremap <leader>u :bro ol<CR>

"Cheap buffer switching
nnoremap <leader>, :ls<CR>:b<Space>

" Cheap ctrl+p (Warning : too slow on big project)
set path=.,**
nnoremap <C-p> :find *
nnoremap ,F :find <C-R>=expand('%:p:h').'/**/*'<CR>
nnoremap ,s :sfind *
nnoremap ,S :sfind <C-R>=expand('%:p:h').'/**/*'<CR>
nnoremap ,v :vert sfind *
nnoremap ,V :vert sfind <C-R>=expand('%:p:h').'/**/*'<CR>

" Mapping like dirvish
map <leader>v :Vexplore %:p:h<cr>

" }}} "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Modeline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: fdm=marker
