"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Light vimrc : No plugins version
" Maintainer: frazrepo
" https://github.com/frazrepo/vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins (experimental) {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !has("nvim")
    packadd! matchit
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible                   " Set default to nocompatible
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
set foldmethod=indent              " Default Foldmethod indent
set formatoptions+=j               " Join option :  Delete comment character when joining commented lines
set gdefault
set hidden                         " A buffer becomes hidden when it is abandoned
set history=200
set hlsearch                       " Highlight search results
set ignorecase                     " Ignore case when searching
set incsearch                      " Makes search act like search in modern browsers
set lazyredraw                     " Don't redraw while executing macros (good performance config)
set linebreak                      " Linebreak on 500 characters
set linespace=4                    " Linespace
set listchars=eol:$,tab:»\ ,trail:.,extends:›,precedes:‹
set magic                          " For regular expressions turn magic on
set matchpairs+=<:>                "Match pairs
set mouse=a                        " Activate mouse

set nobackup                       " Turn backup off, since most stuff is in SVN, git et.c anyway...
set noerrorbells
set nolist                         " List Chars
set noswapfile
set nowritebackup

set number                         " Number - No Default relative number (cause slowness)
set scrolloff=1                    " Set 1 lines to the cursor - when moving vertically using j/k
set shiftwidth=4                   " 1 tab == 4 spaces

set shortmess+=c                   " don't give |ins-completion-menu| messages.
set shortmess=atI                  " Disable startup message

set showbreak=↪\ 
set showmatch                      " Show matching brackets when text indicator is over them

set smartindent                    "Smart indent
set smartcase                      " When searching try to be smart about cases 
set smarttab                       " Be smart when using tabs ;)

set splitbelow                     " Split mode
set splitright

set synmaxcol=200                  " And optimize performance for longlines
set tabstop=4

set timeout timeoutlen=500 ttimeoutlen=50
set ttyfast                        " Make the keyboard fast
set textwidth=500

set undodir=$HOME/.vim/undodir
set undofile                       " Persistent undo : Keep undo history across sessions by storing it in a file

set updatetime=300                 " Smaller updatetime for CursorHold & CursorHoldI
set virtualedit=block              " VirtualEdit block allow selection everywhere in visual block mode
set visualbell t_vb=               " No sound on errors
set whichwrap+=<,>,h,l

set wildignore=*.o,*~,*.pyc,tags   " Ignore compiled files
set wildignore+=*/.git/*,*/node_modules/*,*/dist/*
set wildignore+=.git\*,node_modules\*

set wildmenu                       " Turn on the Wild menu
set wildmode=full

" grepprg to ag
if executable('ag')
    set grepprg=ag\ --vimgrep
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" grepprg to ripgrep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Maximized window on start and Font Size
if has("gui_running")
  "GuiOptions - Horizontal scrollbar
  set guioptions+=b

  if has("gui_gtk2") || has("gui_gtk3") 
    set lines=535 columns=1366
    set guifont=Inconsolata\ 17
  endif

  if has("gui_macvim")
    set lines=768 columns=1366
    set guifont=Menlo\ Regular:h14
  endif

  if has("gui_win32")
    autocmd GUIEnter * :simalt ~n
    set guifont=Consolas:h15:cANSI
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
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>


" Map jk to ESC in insert mode
inoremap jk <Esc>

" For autocompletion
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"

" Search using magic regex
nnoremap / /\v
nnoremap ? ?\v

" Search/Replace
nnoremap <leader>r :%s///g<Left><Left>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"Visual find and replace
nnoremap <Leader>fr :%s/
xnoremap <Leader>fr :<C-u>'<,'>s/

"Search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace','')<CR>

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
map <c-j> }
map <c-k> {


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

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>

" Toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader><bs> :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

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

"Insert new line in normal mode quickly and move cursor (but not in quickfix window or in command line history)
nnoremap <silent> <expr> <cr>  &buftype ==# 'nofile' ? "\<CR>" : &buftype ==# 'quickfix' ? "\<CR>" : ":set paste<CR>o<Esc>:set nopaste<CR>"
nnoremap <silent> <S-cr> :set paste<CR>O<Esc>:set nopaste<CR>

" Navigating quickfix (Experimental)
nnoremap <A-Down> :cnext<Cr>
nnoremap <A-Up> :cprevious<Cr>

" H and L Begin/End on homerow
map H ^
map L g_

" Paste from yank register 
xnoremap <leader>p "0p
nnoremap <leader>p "0p

"Paste quickly in insert mode
inoremap <C-r><C-r> <C-r>*

" Enhance paste in visual mode to replace many times with the yank register
xnoremap <silent> p p:if v:register == '+'<Bar>let @+=@0<Bar>endif<CR>

" Do not track every j and k motion in jumplist  
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'

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

" Toggle to next item
nnoremap <Tab> %

" Execute a macro over a visual range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Expand %% to current path in command line mode
cnoremap %% <C-R>=fnameescape(expand("%:p:h")) . '/'<CR>
cnoremap :: <C-R>=fnameescape(expand("%"))<CR>

" Map for navigating search (/?) result
set wildcharm=<C-z>
cnoremap <expr> <Tab> getcmdtype() =~ '[\/?]' ? "<C-g>" : "<C-z>" 
cnoremap <expr> <S-Tab> getcmdtype() =~ '[\/?]' ? "<C-t>" : "<S-Tab>" 

" Command line CR
cnoremap <expr> <CR> CommandLineCR()

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a txt, markdown and sql buffer for scribble
map <leader>x :e ~/buffer.txt<cr>
map <leader>d :e ~/buffer.md<cr>
map <leader>s :e ~/buffer.sql<cr>

"Adjust font size
nnoremap <M-9>        :Smaller<CR>
nnoremap <M-0>        :Bigger<CR>

" For Tags navigation - <C-$> doesn't work yet
nmap <F12> <C-]>

" Toogle quickfix windows
map <silent> <F8> :call <SID>ToggleQf()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Miscellaneous {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
" Map ALT Key in terminal
if &term =~ 'xterm' && !has("gui_running")
  execute "set <A-k>=\ek"
  execute "set <A-j>=\ej"
endif

" Insert mode cursor for terminal
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Hide tilde ~ sign at the end of buffer
 hi! EndOfBuffer guibg=bg guifg=bg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commands {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
" VisualBlock :  Workaround to start visual block mode on terminal if C-v or C-q is not working
command! VisualBlock execute "normal! \<C-v>"

" W : sudo saves the file (useful for handling the permission-denied error on Linux)
command! W w !sudo tee % > /dev/null

" Smaller/Bigger : Make Fonts bigger or smaller - from tpope vimrc
if has("gui_win32")
  command! -bar -nargs=0 Bigger  :let &guifont = substitute(&guifont,'\d\+','\=submatch(0)+1','')
  command! -bar -nargs=0 Smaller :let &guifont = substitute(&guifont,'\d\+','\=submatch(0)-1','')
else
  command! -bar -nargs=0 Bigger  :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)+1','')
  command! -bar -nargs=0 Smaller :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)-1','')
endif

" RemoveTrailingSpaces : Remove all training spaces
command! RemoveTrailingSpaces call CleanExtraSpaces()

" SortByWidth : Sort lines by width
command! -range=%  SortByWidth <line1>,<line2>call SortByWidth()

" WipeReg : Clean all registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AutoCommands {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
if has("autocmd")
    augroup AutoCommandsGroup
        autocmd!

        " Return to last edit position when opening files (You want this!)
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

        " Clean extra spaces on txt files 
        autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()

        " Help File speedups, <enter> to follow tag, delete (backspace) for back
        autocmd filetype help nnoremap <buffer><cr> <c-]>
        autocmd filetype help nnoremap <buffer><bs> <c-T>
        autocmd filetype help nnoremap <buffer>q :q<CR>
        autocmd filetype help set nonumber
        autocmd filetype help wincmd _ " Maximize the help on open

        " AutoSave Scratch buffer
        autocmd InsertLeave,TextChanged buffer.* nested silent! update
        autocmd FocusGained,BufEnter,CursorHold buffer.* silent! checktime

        " Format : - [ ] Task item
        autocmd FileType markdown nnoremap <buffer> <silent> - :call winrestview(<SID>toggle('^\s*-\s*\[\zs.\ze\]', {' ': '.', '.': 'x', 'x': ' '}))<cr>

    augroup END
endif

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

" Right Angle and Angle Bracket text-object 
" ---------------------------------------
" ir ar
xnoremap ir i[
onoremap ir :<C-u>normal vi[<CR>
xnoremap ar a[
onoremap ar :<C-u>normal va[<CR>

" ia aa
xnoremap ia i>
onoremap ia :<C-u>normal vi><CR>
xnoremap aa a>
onoremap aa :<C-u>normal va><CR>

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

" <TAB>: minimal tab completion.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

" vim-move
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Search in files (ctrlsf)
nnoremap <leader>* :execute "grep " . expand("<cword>") . " **/*" <Bar> cw<CR>
vnoremap <silent> <leader>* :<C-u>call VisualSelection('', '')<CR>:grep <C-R>=@/<CR> **/*<CR>:cw<cr>

":grep foo /dir/*.sql 
nnoremap <leader>/ :grep <C-R>=' **/*.'. expand('%:p:e')<CR><C-Left><Left>
vnoremap <leader>/ :<C-u>call VisualSelection('', '')<CR>:grep <C-R>=@/<CR> **/*.<C-R>=expand('%:p:e')<CR>

"Open automatically the Quickfix Window
autocmd QuickFixCmdPost [^l]* cwindow

" Filter Quickfix list
function! s:FilterQuickfixList(bang, pattern)
  let cmp = a:bang ? '!~#' : '=~#'
  call setqflist(filter(getqflist(), "bufname(v:val['bufnr']) " . cmp . " a:pattern"))
endfunction
command! -bang -nargs=1 -complete=file QFilter call s:FilterQuickfixList(<bang>0, <q-args>)

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

" Mapping like vinegar for netrw
let g:netrw_banner=0
nnoremap - :e %:h<cr>

" Scratch buffer
command! Scratch vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
nnoremap <leader>bs :Scratch<cr>

" Yankmatches/ DeleteMatches
if has('win32') || has('win64')
  nnoremap <silent> ym qxq:g/<C-R>//yank X<CR>:let @*=@x<CR>
else
  nnoremap <silent> ym qxq:g/<C-R>//yank X<CR>:let @+=@x<CR>
endif
nnoremap <silent> dm :g/<C-R>//d<CR>

" gtfo
nnoremap gof :call CopyFilePath()<CR>
function! CopyFilePath()
  let @+=expand('%:p:h')
  let @*=expand('%:p:h')
  echo "File path copied to system clipboard"
endfunction

"Auto-Pairs /Pear Tree replacement
inoremap ( ()<Left>
inoremap <expr> ) getline('.')[getpos('.')[2]-1] == ')' ? '<Right>' : ')'
                   
inoremap [ []<Left>
inoremap <expr> ] getline('.')[getpos('.')[2]-1] == ']' ? '<Right>' : ']'
                   
inoremap { {}<Left>
inoremap <expr> } getline('.')[getpos('.')[2]-1] == '}' ? '<Right>' : '}'
                   
inoremap < <><Left>
inoremap <expr> > getline('.')[getpos('.')[2]-1] == '>' ? '<Right>' : '>'

inoremap <expr> " getline('.')[getpos('.')[2]-1] == '"' ? '<Right>' : '""<Left>'
inoremap <expr> ' getline('.')[getpos('.')[2]-1] == "'" ? '<Right>' : "''<Left>"

" IList Search in the buffer
" nnoremap <leader>f :ilist<space>/
nnoremap <leader>f :execute "vimgrep /" . expand("<cword>") . "/j %" <Bar> cw<CR>
vnoremap <silent> <leader>f :<C-u>call VisualSelection('', '')<CR>:vimgrep/<C-R>=@/<CR>/j %<CR>:cw<cr>

" Minimal vim rooter
" CWD automatically for the current buffer
augroup CwdBufferEnter
  autocmd!
  autocmd Filetype,BufEnter *  call ChangeCurrentWorkingDirectory()
augroup END

" Change Current Working Directory (CWD) to buffer directory
function! ChangeCurrentWorkingDirectory()
  try
    :cd %:p:h
  catch
  endtry
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set statusline=%<\ %f\ %m%r%y%w%=%l\/%-6L\ %3c\ 

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
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Sort lines by width
function! SortByWidth() range
    silent! execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    silent! execute a:firstline . "," . a:lastline . 'sort n'
    silent! execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction

" https://gist.github.com/romainl/047aca21e338df7ccf771f96858edb86 
function! CommandLineCR()
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

" Toggle Checkbox Markdown
function s:toggle(pattern, dict, ...)
  let view = winsaveview()
  execute 'keeppatterns s/' . a:pattern . '/\=get(a:dict, submatch(0), a:0 ? a:1 : " ")/e'
  return view
endfunction

" }}} "

" Host specific vim 
if filereadable(expand($HOME . '/.vimrc.local'))
    source $HOME/.vimrc.local
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Modeline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: fdm=marker
