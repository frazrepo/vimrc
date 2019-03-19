"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       frazrepo
"       https://github.com/frazrepo/vimrc
"
" Debug : vim --startuptime vim.log
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

" Same for undolevels
set undolevels=1000

" Filetype
set nocompatible 

" Disable startup message
set shortmess=atI

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>" 

" Fast saving
nmap <leader>w :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 1 lines to the cursor - when moving vertically using j/k
set so=1

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Do no display toolbar to have more text by default 
if has("gui_running")
    set guioptions -=T
endif

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim and gVim
if has("gui_running")
  autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

" foldmethod manual
set foldmethod=manual 

" Dealing with special chars
set encoding=utf-8
" set fileencoding=utf-8

" Activate mouse
set mouse=a
set nu

" Make the keyboard fast
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50

" Default relativenumber
set relativenumber

" Maximized window on start
if has("gui_running")
  if has("gui_gtk3")
    set lines=535 columns=1366
    " set lines=768 columns=1366 " cause bug infinite max size not supported on linux, all fonts and linespace not working
    " http://ubuntuguide.net/get-gvim-start-in-maximized-window-in-ubuntu-gnome
  elseif has("gui_macvim")
    set lines=768 columns=1366
  elseif has("gui_win32")
    " set lines=768 columns=1366
    " For french keyboard
    autocmd GUIEnter * :simalt ~n
  endif
endif

" Linespace
set linespace=8

" List Chars
set nolist
set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<
set showbreak=\\ "

" Tab title
set guitablabel=%N/\ %t\ %M

" Split mode
set splitbelow
set splitright

" Insert mode cursor for terminal (xterm, bash, tmux,...)
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Activate by default dracula theme
syntax on

" And optimize performance for longlines
set synmaxcol=200

" ColorScheme dracula for GUI and atom for terminal
if has("gui_running")
    color ayu
    " nord, dracula
else
    color apprentice
endif

" Fonts Consolas
if has("gui_running")
  if has("gui_gtk2") || has("gui_gtk3") 
   " Install fonts on Ubuntu
   " sudo apt-get install fonts-inconsolata
   " sudo fc-cache -fv
    set guifont=Inconsolata\ 16
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h20:cANSI
  endif
endif

" Make Fonts bigger or smaller - from tpope vimrc
if has("gui_win32")
  command! -bar -nargs=0 Bigger  :let &guifont = substitute(&guifont,'\d\+','\=submatch(0)+1','')
  command! -bar -nargs=0 Smaller :let &guifont = substitute(&guifont,'\d\+','\=submatch(0)-1','')
else
  command! -bar -nargs=0 Bigger  :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)+1','')
  command! -bar -nargs=0 Smaller :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)-1','')
endif
nnoremap <M-9>        :Smaller<CR>
nnoremap <M-0>        :Bigger<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Complete option
set complete=.,w,b,u

""""""""""""""""""""""""""""""
" => Mode related
""""""""""""""""""""""""""""""
" Map jk to ESC in insert mode 
inoremap jk <Esc>

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" When you press `<leader>r` you can search and replace the selected text:
vnoremap <silent> <leader>r :call VisualSelection('replace','')<CR>

"Visual find and replace
nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

" VirtualEdit block allow selection everywhere in visual block mode
set virtualedit=block

" Repeat . command in visual mode
vnoremap . :normal.<CR>

" Keep selection in select mode after shifting
" Indenting not working when the line starts with ##
vnoremap > >gv
vnoremap < <gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Search using magic regex
nnoremap / /\v
nnoremap ? ?\v

" Disable highlight when <leader><space> is pressed
map <silent> <leader><space> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Center next macth
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffers 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Creating splits with empty buffers in all directions
nnoremap <Leader>hn :leftabove  vnew<CR>
nnoremap <Leader>ln :rightbelow vnew<CR>
nnoremap <Leader>kn :leftabove  new<CR>
nnoremap <Leader>jn :rightbelow new<CR>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Useful mapping for managing  buffers
map <leader>bn :enew<cr>
map <leader>ba :bufdo bd<cr>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Backspace to navigate to alternate buffer
nnoremap <bs> <c-^>

" Edit quickly with the current buffer path
cnoremap %% <c-r>=expand("%:p:h")<cr>/ 
map <leader>e :edit <c-r>=expand("%:p:h")<cr>/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
nmap <Leader><bs> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Experimental, CWD automatically for the current buffer
augroup CwdBufferEnter
  autocmd!
  autocmd Filetype,BufEnter *  call ChangeCurrentWorkingDirectory()
augroup END

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Editing Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Change word under cursor and dot repeat, really useful to edit quickly
nnoremap c* *Ncgn
nnoremap c# #NcgN

" Quick yanking to the end of the line
call yankstack#setup()
nnoremap Y y$

" Quick macro recording and replaying ,qq for recording, and Q for replaying
nnoremap Q @q

" Remap VIM 0 to first non-blank character
map 0 ^

" Indent/Format All documents using = or gq
nnoremap g= mmgg=G`m
nnoremap gQ mmgggqG`m

"Insert new line in normal mode quickly
nnoremap <M-o> mao<Esc>`aj
nnoremap <M-O> maO<Esc>`ak
inoremap <M-o>      <C-O>o
inoremap <M-O>      <C-O>O

"Quick beautiful paste hack
nnoremap "p vi"p
nnoremap 'p vi'p
nnoremap (p vi(p
nnoremap )p vi)p

" Auto-Expand (experimental)
inoremap (; (<CR>);<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O

" Marks keekjumps for azerty keyboard
nnoremap mù m`
nnoremap ùù ``

" Experimental H and L
map H ^
map L $

" Do not track every j and k motion in jumplist  
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

" Ctrl-Space for completions. 
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a txt buffer for scribble
map <leader>q :e ~/buffer.txt<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Quickly open a sql buffer for scribble
map <leader>s :e ~/buffer.sql<cr>

" Toogle quickfix windows
map <silent> <F8> :call <SID>ToggleQf()<cr>

" Workaround to start visual block mode on terminal if C-v or C-q is not working
command! VisualBlock execute "normal! \<C-v>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Help file speedups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Help File speedups, <enter> to follow tag, delete (backspace) for back
au filetype help nnoremap <buffer><cr> <c-]>
au filetype help nnoremap <buffer><bs> <c-T>
au filetype help nnoremap <buffer>q :q<CR>
au filetype help set nonumber
au filetype help wincmd _ " Maximize the help on open

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

" Visual selection, find/replace
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! VisualFindAndReplace()
    :OverCommandLine%s/
endfunction

function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
endfunction

" Toogle quickfix windows
function! s:ToggleQf()
  for buffer in tabpagebuflist()
    if bufname(buffer) == ''
      " then it should be the quickfix window
      cclose
      return
    endif
  endfor

  copen
endfunction

" Execute a macro over a visual range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" List all leader mappings
function! ListLeaders()
     silent! redir @a
     silent! nmap <LEADER>
     silent! redir END
     silent! new
     silent! put! a
     silent! g/^s*$/d
     silent! %s/^.*,//
     silent! normal ggVg
     silent! sort
     silent! let lines = getline(1,"$")
endfunction
command! ListLeaders call ListLeaders()

" Change Current Working Directory (CWD) to buffer directory
function! ChangeCurrentWorkingDirectory()
try
  :cd %:p:h
catch
endtry
endfunction

" AutoSave Scracth buffer
function! s:save_buffer() abort
  if empty(&buftype) && !empty(bufname(''))
    let l:savemarks = {
          \ "'[": getpos("'["),
          \ "']": getpos("']")
          \ }

    silent! update

    for [l:key, l:value] in items(l:savemarks)
      call setpos(l:key, l:value)
    endfor
  endif
endfunction

augroup save_buffer
  autocmd!
  autocmd InsertLeave,TextChanged buffer.* nested call s:save_buffer()
  autocmd FocusGained,BufEnter,CursorHold buffer.* silent! checktime
augroup end