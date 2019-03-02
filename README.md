
## How to install for Linux ?

    1) git clone --depth=1 https://github.com/frazrepo/vimrc.git ~/.vim_runtime
    
    2) run ./install.sh

## How to install Windows ?

    1) git clone --depth=1 https://github.com/frazrepo/vimrc.git %USERPROFILE%/.vim_runtime
    
    2) run install.bat

## How to update to latest version?

Just do a git rebase!

    cd ~/.vim_runtime
    git pull --rebase

And run install.sh (or install.bat) to update vimrc configuration file

### Leader key

    leader = <space>

### Available color scheme

    Default GUI : auy (light theme), dracula (dark theme)
    Default Terminal : monokai (dark theme)
    Dark theme : anderson, atom-dark256, codedark, minimalist, molokai, monokai(sublime text), papercolor, seoul, space-vim-dark
    Light theme : ayu (dark available), seoul256-light, pencil

### Normal mode mappings

Fast saving of a buffer (`<leader>w`):

    nmap <leader>w :w!<cr>
    
Map `<Space>` to `/` (search) and `<Ctrl>+<Space>` to `?` (backwards search):
    
    map <space> /
    map <c-space> ?
    map <leader>fr : FindReplace with highlighted text (vim-over)

Disable highlights when you press `<leader><space>`:
    
    map <silent> <leader><space> :noh<cr>

Smart way to move between windows (`<ctrl>j` etc.):
    
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l

Useful mappings for managing buffers :

    " New buffer
     <leader>bn

    " Close current buffer
    <leader>bd
    
    " Close all buffers
    <leader>ba
    
    " Wipeout all hidden buffers
    <leader>bw

    " Navigate alternate buffer
    <bs>

    " Navigate left and right buffer
    <leader>h, <leader>l
    
Useful mappings for managing tabs:
    
    gt or (ngt) : Go to tab or Go to nth tab
    <leader>tn :tabnew<cr>
    <leader>to :tabonly<cr>
    <leader>tc :tabclose<cr>
    <leader>tm :tabmove 
    <leader>tl or <leader><bs> : alternate tab 
    
    " Opens a new tab with the current buffer's path
    " Super useful when editing files in the same directory
    map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

Quickly open an empty buffer in all direction:	
    
    nnoremap <Leader>hn :leftabove  vnew<CR>
    nnoremap <Leader>ln :rightbelow vnew<CR>
    nnoremap <Leader>kn :leftabove  new<CR>
    nnoremap <Leader>jn :rightbelow new<CR>

Quickly open a buffer for scripbble:
    
    map <leader>q :e ~/buffer<cr>
    map <leader>x :e ~/buffer.md<cr>

Toggle paste mode on and off:
    
    map <leader>pp :setlocal paste!<cr>


### Editing mappings

Insert  ; or : at the end of a line

    ,; or ,:

Quick tips in insert mode to emulate normal mode command

    II like I
    AA like A
    SS like S
    CC like C
    DD like D
    UU like U

Insert a new line above or below in normal mode

    Below : Shift-Enter or <M-o> or )<space>
    Above : <M-0> or (<space>

Paste inner object quickly

    "p for vi"p
    'p for vi'p
    (p for vi(p
    )p for vi)p

### Visual mode mappings

Visual mode pressing `*` or `#` searches for the current selection:

    vnoremap <silent> * :call VisualSelection('f')<CR>
    vnoremap <silent> # :call VisualSelection('b')<CR>

When you press `<leader>r` you can search and replace the selected text:

    vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

### Command line mappings

Write the file as sudo (works only on Unix). Super useful when you open a file and you don't have permissions to save your changes. [Vim tip](http://vim.wikia.com/wiki/Su-write):

    :W 

### Various mappings

Toggle QuickFix windows
    
    F8

Rotate ColorSchemes
    
    F10

Open current buffer directory in windows explorer (Windows only)

    F11

Whichkey - Help remembering mapping with leader key
    
    F12

Remove bad formatting ^M
    
    <Leader>m

Set font bigger or smaller
    
    Bigger : <M-0> or <M-.>
    Smaller : <M-9> or <M-,>

### Plugins usage

**Emmet**

    Generation: <tab>,

**Tabular**

    :Tab(ularize) /(separator) (Eg :Tab /=)

**vim-abolish**

    Search Command: Subvert
    Coercion :  Press crs (coerce to snake_case). MixedCase (crm), camelCase (crc), snake_case (crs), UPPER_CASE (cru), dash-case (cr-), dot.case (cr.), space case (cr<space>), and Title Case (crt)

**vim-exchange**

    Operator : cx{motion}
    Line : cxx

**vim-operator-replace**

    Operator : {"register}cp{motion}

**vim-surround**

    Change: cs"', cst"
    Add : ysiw], ysim<em>
    Delete :  ds", ds{
    Visual Mode : select and then S" or S'    

**nerdtree**

    Default directory :      <leader>nn 
    Current file directory:  <leader>nf

**vim-unimpaired**

    Map keys : ( and )
    Switch between tabs   : (t, )t
    Switch between buffers: (b, )b
    Toggle Options : yo[r,n,w,x,....]
    Lines operations : (space, )space, 10)space, (e, )e

**fzf**

    Files   : <c-t> (t to open file in tab)
    Buffers : <c-b> or ,b
    MRU     : <M-m> or ,m
    K       : Ag select words

**vim-rainbow**

    Toggle coloring :RainbowToogle

**vim-rotatescheme**

    Rotate Forward/Backward : F10 / <S-F10>

**vim-yankstack**

    Cycle Paste : ,p and ,n
    Toggle YRShow  : F3

**vim-sqlformat**

    Formatting : gq{motion} or {visual}gq

**vim-signature**

    Add(Toggle) mark : ma, mb, ...
    Navigation between marks : (' or )'
    Delete all marks : m<space>

**vim-scripts/Tranpose**

    Commands : Tranpose, TranposeWords, TranposeTab, TranposeCSV, TranposeInteractive

**sort-motion**

    Sorting : gs(motion) [ Ex: gs3j, gsi(,...]

**goyo and zenroom for markdown**

    Zen mode : <leader>z

**vim-sneak**

    Search : s{char}{char}
    Combine with Surround : z{char}{char} , Ex: yszab"
    Next/Previous match :  ; / ,

**ultisnips and vim-snippets**

    Activation : <tab>

**CtrlSF**

    ff      : Find selected word 
    F9      : Toggle CtrlSF result Window 
    <C-f>f  : Prompt in command line to find a pattern

**yankmatches**

    ym / YM : Yank highlighted search lines  (YM for inverse) 
    dm / DM : Delete highlighteed search line (DM for inverse)

**zirrostig/vim-schlepp**

    up/down/left/right : After a selection in visual mode, drag using arrow key

**custom text-objects**

    Uri u       : ciu, dau
    Quotes q    : ciq, daq
    Comments c  : cic, dac
    Indents i   : cii, dai
    Targets     : cin(l)q, dai, ci,, ci=, ..
    Line l      : cil, yil
    Entire e    : yie, cie

## Custom Docs

Regexp search/replace pattern

    :helptags fz-regexp
    :helptags fz-macro

## Plugins list

- [ack.vim](https://github.com/mileszs/ack.vim) : Search in files
- [ale](https://github.com/w0rp/ale) : Linter
- [auto-pairs](https://github.com/jiangmiao/auto-pairs) : () , {} ,[] , etc...
- [completor](https://github.com/maralla/completor.vim) : Manage auto completion correctly
- [ctrlsf.vim](https://github.com/dyng/ctrlsf.vim) : Side searching
- [yankstack](https://github.com/maxbrunsfeld/vim-yankstack): Enhance copy/paste experience
- [emmet-vim](https://github.com/mattn/emmet-vim) : Html editing
- [fzf / fzf.vim](https://github.com/junegunn/fzf.vim)
- [goyo](https://github.com/junegunn/goyo.vim) : Dependency for zenroom2
- [LargeFile](http://www.vim.org/scripts/script.php?script_id=1506) : Handling large files
- [lightline](https://github.com/itchyny/lightline.vim) : Lightweight status line 
- [fzfmru](https://github.com/pbogut/fzf-mru.vim) : Browse most recent files
- [nerdtree](https://github.com/scrooloose/nerdtree) : File browser
- [tabular](https://github.com/godlygeek/tabular) : Align lines bases on separator
- [utilsnips + vim-snippets](https://github.com/SirVer/ultisnips) : Snippets
- [vim-abolish](https://github.com/tpope/vim-abolish) : Search words, Coercion
- [vim-autoformat](https://github.com/Chiel92/vim-autoformat)
- [vim-commentary](https://github.com/tpope/vim-commentary)
- [* vim-cool](https://github.com/romainl/vim-cool) : Enhance hlsearch experience
- [* vim-exchange](https://github.com/tommcdo/vim-exchange) : Exchange in pair with a new operator cx
- [vim-fugitive](https://github.com/tpope/vim-fugitive) : Git command inside vim
- [vim-hardtime](https://github.com/takac/vim-hardtime) : For practising hardmode (timer on hjkl and arrow keys)
- [* vim-operator-user/vim-operator-replace](https://github.com/kana/vim-operator-replace) : Custom operators
- [vim-move](https://github.com/matze/vim-move) : Move lines or selections up and down using (ALT) jk keys
- [vim-obsession / vim-prosession](https://github.com/dhruvasagar/vim-prosession) : Autosave session
- [* vim-over](https://github.com/osyo-manga/vim-over) : Highlight buffer when operating from command line (s/, /, g/)
- [vim-polyglot](https://github.com/sheerun/vim-polyglot) : Languages Support
- [vim-quickscope](https://github.com/unblevable/quick-scope) : Highlight potential candidates for inline searching with f or t
- [vim-rainbow](https://github.com/luochen1990/rainbow) : Color parentheses, brackets,...
- [vim-repeat](https://github.com/tpope/vim-repeat) : To repeat plugin command with dot (.)
- [vim-rotatescheme](https://github.com/frazrepo/vimrc/tree/master/plugins/vim-rotatescheme) : Custom plugin to rotate a list of colorschemes
- [vim-schlepp](https://github.com/zirrostig/vim-schlepp) : Drag selection in visual mode
- [vim-signature](https://github.com/kshenoy/vim-signature) : Display marks
- [vim-signify](https://github.com/mhinz/vim-signify) : Git status
- [vim-sneak](https://github.com/justinmk/vim-sneak) : Find text using two characters (line f but handle vertical positions)
- [vim-sort-motion](https://github.com/christoomey/vim-sort-motion) : Add an operator gs to apply sort
- [vim-sqlformat](https://github.com/mpyatishev/vim-sqlformat) : SQL formatting
- [* vim-surround](https://github.com/tpope/vim-surround) : Surround text
- [vim-textobj](https://github.com/kana/vim-textobj-user/wiki) | [targets.vim](https://github.com/wellle/targets.vim) : Some text objects -  uri (u), quotes (q), comments (c), indents (i), line (l), entire buffer (e)
- [vim-tranpose](https://github.com/salsifis/vim-transpose) : Tranpose lines, csv, words, ...
- [* vim-unimpaired](https://github.com/tpope/vim-unimpaired) :  Toogle Options, Next/Previous, Switch Lines or Add Spaces
- [vim-whichkey](https://github.com/liuchengxu/vim-which-key) : Help remembering mapping
- [vim-wipeout](https://github.com/artnez/vim-wipeout) : Close all hidden buffers
- [vim-zenroom2 (use goyo)](https://github.com/amix/vim-zenroom2) : Zen mode editing
- [yankmatches](https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/plugin/yankmatches.vim) : Copy or Delete search results

[*] : A grade plugins, "sharpen the saw" philosophy
  
## How to uninstall
Just do following:
* Remove `~/.vim_runtime`
* Remove any lines that reference `.vim_runtime` in your `~/.vimrc`

## Inspiration
* [https://github.com/amix/vimrc](https://github.com/amix/vimrc)
* [https://github.com/nvie/vimrc/blob/master/vimrc](https://github.com/nvie/vimrc/blob/master/vimrc)
* [https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup](https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup)
