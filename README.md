
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

### Normal mode mappings

Fast saving of a buffer (`<leader>w`):

	nmap <leader>w :w!<cr>
	
Map `<Space>` to `/` (search) and `<Ctrl>+<Space>` to `?` (backwards search):
	
	map <space> /
	map <c-space> ?

Disable highlights when you press `<leader><space>`:
	
	map <silent> <leader><space> :noh<cr>

Smart way to move between windows (`<ctrl>j` etc.):
	
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l

Closing of the current buffer(s) (`<leader>bd` and (`<leader>ba`)):
	
	" Close current buffer
	map <leader>bd :Bclose<cr>
	
	" Close all buffers
	map <leader>ba :bufdo bd<cr>
	
	" Wipeout all hidden buffers
	map <leader>bw :Wipeout<cr>
	
Useful mappings for managing tabs:
	
    gt or (ngt) : Go to tab or Go to nth tab
	map <leader>tn :tabnew<cr>
	map <C-n> :tabnew<cr>
	map <leader>to :tabonly<cr>
	map <leader>tc :tabclose<cr>
	map <leader>tm :tabmove 
	map <leader>tl :tabnext 
	
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


### Visual mode mappings

Visual mode pressing `*` or `#` searches for the current selection:

	vnoremap <silent> * :call VisualSelection('f')<CR>
	vnoremap <silent> # :call VisualSelection('b')<CR>

When you press `<leader>r` you can search and replace the selected text:

	vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

Surround the visual selection in parenthesis/brackets/etc.:

    vnoremap $1 <esc>`>a)<esc>`<i(<esc>
    vnoremap $2 <esc>`>a]<esc>`<i[<esc>
    vnoremap $3 <esc>`>a}<esc>`<i{<esc>
    vnoremap $$ <esc>`>a"<esc>`<i"<esc>
    vnoremap $q <esc>`>a'<esc>`<i'<esc>
    vnoremap $e <esc>`>a"<esc>`<i"<esc>

### Command line mappings

Write the file as sudo (works only on Unix). Super useful when you open a file and you don't have permissions to save your changes. [Vim tip](http://vim.wikia.com/wiki/Su-write):

    :W 

### Various mappings

Open current buffer directory in windows explorer (Windows only)

    F11

Whichkey - Help remembering mapping with leader key
    
    F12

Toggle QuickFix windows
    
    F8

### Plugins usage

**Emmet**

    Generation: <tab>,

**Tabular**

    :Tab(ularize) /(separator) (Eg :Tab /=)

**vim-abolish**

    Search Command: Subvert
    Coercion :  Press crs (coerce to snake_case). MixedCase (crm), camelCase (crc), snake_case (crs), UPPER_CASE (cru), dash-case (cr-), dot.case (cr.), space case (cr<space>), and Title Case (crt)

**vim-surround**

    Change: cs"', cst"
    Add : ysiw], ysim<em>
    Delete :  ds", ds{
    Visual Mode : select and then S" or S'    

**nerdtree**

    Default directory :      <leader>nn 
    Current file directory:  <leader>nf

**mru**

    Recent files : <leader>f

**vim-unimpaired**

    Map keys : ( and )
    Switch between tabs   : (t, )t
    Switch between buffers: (b, )b
    Toggle Options : yo[r,n,....]
    Lines operations : (space, )space, 10)space, (e, )e

**fzf**

    Files : CTRL + p (t to open file in tab)
    Buffers : <leader>b
    K : Ag select words

**vim-rainbow**

    Toggle coloring :RainbowToogle

**vim-sqlformat**

    Formattting : select and just use gq

**sort-motion**

    Sorting : gs(motion) [ Ex: gs3j, gsi(,...]

**goyo and zenroom**

    Zen mode : <leader>z

**vim-bookmarks**

    Add/Remove bookmark : mm
    Show all : ma

**vim-sneak**

    Search : s{char}{char}
    Combine with Surround : z{char}{char} , Ex: yszab"
    Next match : , ;

**ultisnips and vim-snippets**

    Activation : <tab>

**splitjoin-vim**

    Join gJ
    Split gS

**CtrlSF**

    F  : Find selected word 
    F9 : Toggle CtrlSF result Window 

**yankmatches**

    ym / YM : Yank highlighted search lines  (YM for inverse) 
    dm / DM : Delete highlighteed search line (DM for inverse)

**zirrostig/vim-schlepp**

    up/down/left/right : After a selection in visual mode, drag using arrow key

**custom text-objects**

    Uri u , ciu, dau
    Quotes q, ciq, daq
    Comments c, cic, dac
    Indents i, cii, dai
    Targets cin(l)q, dai, ci,, ci=, ..

## Custom Docs

Regexp search/replace pattern

    :helptags fz-regexp
    :helptags fz-macro

## Plugins list

- ale
- ack.vim : Search in files
- vim-abolish : Search words, Coercion
- emmet-vim : Html editing
- fzf / fzf.vim
- goyo : Dependency for zenroom2
- lightline : Lightweight status line 
- mru : Browse most recent files
- nerdtree : File browser
- vim-sqlformat : SQL formatting
- tabular : Align lines bases on separator
- completor : Manage auto completion correctly
- vim-autoformat
- auto-pairs : () , {} ,[] , etc...
- vim-commentary
- vim-fugitive : Git command inside vim
- vim-signify : Git status
- vim-markdown : Markdown editing
- vim-move : Move lines or selections up and down using (ALT) jk keys
- vim-obsession / vim-prosession : Autosave session
- vim-rainbow : Color parentheses, brackets,...
- vim-repeat
- vim-sort-motion
- ctrlsf.vim  : Side searching
- vim-surround : Surround text
- vim-sneak : Find text using two characters (line f but handle vertical positions)
- splitjoin.vim : Split or Join lines (code)
- vim-unimpaired :  Toogle Options, Next/Previous, Switch Lines or Add Spaces
- vim-signature : Display marks
- vim-bookmarks : Add bookmarks management easily
- utilsnips + vim-snippets : Snippets
- vim-zenroom2 (use goyo) : Zen mode editing
- vim-whichkey : Help remembering mapping
- vim-wipeout : Close all hidden buffers
- vim-textobj/targets.vim : Some text objects -  uri (u), quotes (q), comments (c), indents (i)
- yankmatches : Copy or Delete search results
- vim-schlepp : Drag selection in visual mode

## How to uninstall
Just do following:
* Remove `~/.vim_runtime`
* Remove any lines that reference `.vim_runtime` in your `~/.vimrc`

## Inspiration
* [https://github.com/amix/vimrc](https://github.com/amix/vimrc)
* [https://github.com/nvie/vimrc/blob/master/vimrc](https://github.com/nvie/vimrc/blob/master/vimrc)
* [https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup](https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup)