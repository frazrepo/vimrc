"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: frazrepo
" https://github.com/frazrepo/vimrc
"
" Debug : vim --startuptime vim.log
"
" To start vim without using this .vimrc file, use:
"     vim -u NORC
"
" To start vim without loading any .vimrc or plugins, use:
"     vim -u NONE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Global Mode Variables {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Define this variable for developer edition
" Currently for nvim only
if has('nvim')
  let g:developer_edition = 1
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set default to nocompatible
set nocompatible

" Sets how many lines of history VIM has to remember
set history=1000

" Same for undolevels
set undolevels=1000

" Persistent undo : Keep undo history across sessions by storing it in a file
set undodir=$HOME/.vim/undodir
set undofile

" Do not show mode (displayed by lightline already)
set noshowmode

" Disable startup message
set shortmess=atI

"Fix : Press Enter or Type Command to continue error in nvim 
if exists("g:developer_edition") 
  set cmdheight=2
endif

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Space as a Leader key
let mapleader = "\<Space>" 

" Fast saving
nmap <leader>w :w!<cr>

" Default to system clipboard
set clipboard^=unnamed,unnamedplus

" :W sudo saves the file 
" (useful for handling the permission-denied error on Linux)
command! W w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 1 lines to the cursor - when moving vertically using j/k
set scrolloff=1

" Turn on the Wild menu
set wildmenu
set wildmode=longest:full,full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,tags
if has("win32") || has("win64")
    set wildignore+=.git\*,node_modules\*
else
    set wildignore+=*/.git/*,*/node_modules/*,*/dist/*
endif

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Defaut global replace
set gdefault

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

" No sound on errors
set noerrorbells
set visualbell t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Foldmethod manual
set foldmethod=manual 
set foldlevelstart=99 

" Dealing with special chars
set encoding=utf-8

" Activate mouse
set mouse=a

" Make the keyboard fast
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50

" Number - No Default relative number (cause slowness)
set number

" Automatically reload file on change without asking
set autoread

" Join option :  Delete comment character when joining commented lines
set formatoptions+=j 

" Linespace
set linespace=4

" List Chars
set nolist
set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<
set showbreak=\\ "

" Split mode
set splitbelow
set splitright

" Insert mode cursor for terminal (xterm, bash, tmux,...)
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"ColorColumn at 80 Experimental
" set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Activate by default dracula theme
syntax on

" And optimize performance for longlines
set synmaxcol=200


" Maximized window on start and Font Size
if has("gui_running")
  if has("gui_gtk2") || has("gui_gtk3") 
    set lines=535 columns=1366
    set guifont=Inconsolata\ 16
  elseif has("gui_macvim")
    set lines=768 columns=1366
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    autocmd GUIEnter * :simalt ~n
    set guifont=Consolas:h15:cANSI
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
" => Files, backups and undo {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set linebreak
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Complete option
set complete=.,w,b,u

""""""""""""""""""""""""""""""
" => Insert Mode related {{{1
""""""""""""""""""""""""""""""

" Map jk to ESC in insert mode 
inoremap jk <Esc>

" CTRL-U in insert mode deletes a lot.	Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Go to end
inoremap <C-a> <C-O>^
inoremap <C-e> <C-O>$

""""""""""""""""""""""""""""""
" => Visual mode related {{{1
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

" Reselect last insertext
nnoremap gV `[v`]

"Cycle visual mode
xnoremap <expr> v 
              \ (mode() ==# 'v' ? "\<C-V>"
              \ : mode() ==# 'V' ? 'v' : 'V')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Search using magic regex
nnoremap / /\v
nnoremap ? ?\v

" Search/Replace
nnoremap <leader>r :OverCommandLine%s///g<Left><Left>
    
" Disable highlight when <space><space> is pressed
map <silent> <space><space> :noh<cr>

" Smart way to move between windows horizontally
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move faster vertically
nnoremap <c-j> 5j
nnoremap <c-k> 5k
xnoremap <c-j> 5j
xnoremap <c-k> 5k

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffers  {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader><bs> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing Mappings {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"Insert new line in normal mode quickly and move cursor (but not in quickfix window)
" nnoremap <silent> <expr> <cr>  &buftype ==# 'quickfix' ? "\<CR>" : ":set paste<CR>m`o<Esc>``:set nopaste<CR>"
" nnoremap <silent> <S-cr> :set paste<CR>m`O<Esc>``:set nopaste<CR>

nnoremap <silent> <expr> <cr>  &buftype ==# 'quickfix' ? "\<CR>" : ":set paste<CR>o<Esc>:set nopaste<CR>"
nnoremap <silent> <S-cr> :set paste<CR>O<Esc>:set nopaste<CR>

" Navigating quickfix (Experimental)
nnoremap <A-Down> :cnext<Cr>
nnoremap <A-Up> :cprevious<Cr>

" H and L Begin/End on homerow
map H ^
map L $

"Quick beautiful paste hack
nnoremap "p vi""0p
nnoremap 'p vi'"0p
nnoremap (p vi("0p
nnoremap )p vi)"0p

" Paste from yank register 
xnoremap <leader>p "0p
nnoremap <leader>p "0p

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		     :update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" Enhance paste in visual mode to replace many times with the yank register
xnoremap <silent> p p:if v:register == '"'<Bar>let @@=@0<Bar>endif<CR>

" Do not track every j and k motion in jumplist  
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'

" Toogle gj gk and j k
nnoremap gj j 
nnoremap gk k 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Azerty keyboard optimizations {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Map some keys for azerty keyboard
map µ # 
map ² . 

" Marks keepjumps 
nnoremap mù m`
nnoremap ùù ``
nnoremap ' `

"Experimental
map à @

" For Tags navigation - <C-$> doesn't work yet
nmap <F12> <C-]>

" Map ALT Key in terminal
" https://vi.stackexchange.com/questions/2350/how-to-map-alt-key
if &term =~ 'xterm' && !has("gui_running")
  " Tell vim what escape sequence to expect
  execute "set <A-k>=\ek"
  execute "set <A-j>=\ej"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Miscellaneous {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Expand %% to current path in command line mode
cnoremap %% <C-R>=fnameescape(expand("%:p:h")) . '/'<CR>
cnoremap :: <C-R>=fnameescape(expand("%"))<CR>

" Map for navigating search (/?) result
set wildcharm=<C-z>
cnoremap <expr> <Tab> getcmdtype() =~ '[\/?]' ? "<C-g>" : "<C-z>" 
cnoremap <expr> <S-Tab> getcmdtype() =~ '[\/?]' ? "<C-t>" : "<S-Tab>" 

" For autocompletion
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <silent> ,f <C-x><C-f>
inoremap <silent> ,i <C-x><C-i>
inoremap <silent> ,l <C-x><C-l>
inoremap <silent> ,n <C-x><C-n>
inoremap <silent> ,o <C-x><C-o>
inoremap <silent> ,t <C-x><C-]>
inoremap <silent> ,u <C-x><C-u>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a txt, markdown and sql buffer for scribble
map <leader>x :e ~/buffer.txt<cr>
map <leader>d :e ~/buffer.md<cr>
map <leader>s :e ~/buffer.sql<cr>

" Toogle quickfix windows
map <silent> <F8> :call <SID>ToggleQf()<cr>

" Workaround to start visual block mode on terminal if C-v or C-q is not working
command! VisualBlock execute "normal! \<C-v>"

" grepprg to ag
if executable('ag')
    set grepprg=ag\ --vimgrep
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Netrw configuration {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:netrw_banner=0
let g:netrw_winsize=15
let g:netrw_liststyle=3
let g:netrw_browse_split = 4
let g:netrw_altv = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Help file speedups {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Help File speedups, <enter> to follow tag, delete (backspace) for back
au filetype help nnoremap <buffer><cr> <c-]>
au filetype help nnoremap <buffer><bs> <c-T>
au filetype help nnoremap <buffer>q :q<CR>
au filetype help set nonumber
au filetype help wincmd _ " Maximize the help on open

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text-Objects {{{1
" https://gist.github.com/romainl/c0a8b57a36aec71a986f1120e1931f20
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Line text-object
" -----------------
" il al
xnoremap il g_o0
onoremap il :<C-u>normal vil<CR>
xnoremap al $o0
onoremap al :<C-u>normal val<CR>

" Number text-object (integer and float)
" ---------------------------------------
" in an
function! VisualNumber()
	call search('\d\([^0-9\.]\|$\)', 'cW')
	normal v
	call search('\(^\|[^0-9\.]\d\)', 'becW')
endfunction
xnoremap in :<C-u>call VisualNumber()<CR>
onoremap in :<C-u>normal vin<CR>

" Buffer(entire) text-object
" -------------------
" ie ae
xnoremap ie GoggV
onoremap ie :<C-u>normal vie<CR>
xnoremap ae GoggV
onoremap ae :<C-u>normal vae<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions and Commands {{{1
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

" RemoveTrailingSpaces
command! RemoveTrailingSpaces call CleanExtraSpaces()

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
  silent! %sort
  silent! let lines = getline(1,"$")
endfunction
command! ListLeaders call ListLeaders()

" AutoSave Scratch buffer
function! s:SaveBuffer() abort
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

augroup SaveBuffer
  autocmd!
  autocmd InsertLeave,TextChanged buffer.* nested call s:SaveBuffer()
  autocmd FocusGained,BufEnter,CursorHold buffer.* silent! checktime
augroup end

" Sort lines by width
function! SortByWidth() range
    silent! execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    silent! execute a:firstline . "," . a:lastline . 'sort n'
    silent! execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction
command! -range=%  SortByWidth <line1>,<line2>call SortByWidth()

"  Clean all register
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor 

" https://gist.github.com/romainl/047aca21e338df7ccf771f96858edb86 
function! CCR()
    let cmdline = getcmdline()
    if cmdline =~ '\v\C/(#|nu|num|numb|numbe|number)$'
        " like :g//# but prompts for a command
        return "\<CR>:"
    elseif cmdline =~ '\v\C^(dli|il)'
        " like :dlist or :ilist but prompts for a count for :djump or :ijump
        return "\<CR>:" . cmdline[0] . "j  " . split(cmdline, " ")[1] . "\<S-Left>\<Left>"
    else
        return "\<CR>"
    endif
endfunction
" map '<CR>' in command-line mode to execute the function above
cnoremap <expr> <CR> CCR()

"Templates (Experimental)
augroup Templates
  autocmd!
  autocmd BufNewFile * silent! :call ReadTemplate(expand("%:e"))
augroup END

function! ReadTemplate(extension)
  let s:templateFile = $HOME . '/.vim_runtime/templates/' . a:extension . '.tpl'
  execute '0r '. s:templateFile
  normal j
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load Plugins and Configs {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugins and Configurations
source $HOME/.vim_runtime/plugins.vim
source $HOME/.vim_runtime/plugins_config.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color Scheme {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Check colorScheme function
function! HasColorscheme(name)
    let pat = 'colors/'.a:name.'.vim'
    return !empty(globpath(&rtp, pat))
endfunction

" ColorScheme ayu for GUI and apprentice for terminal
if has("gui_running")
  if HasColorscheme('ayu')
    color ayu
    " Alternative : nord, dracula
  endif
else
  if HasColorscheme('apprentice')
    color apprentice
  endif
endif
" }}} "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Modeline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: fdm=marker
