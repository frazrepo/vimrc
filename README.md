
## How to install ?

	1) git clone --depth=1 https://github.com/frazrepo/vimrc.git ~/.vim_runtime
	
	2) use the provided _vimrc

	3) start vim and do a :PluginInstall
	
## How to update to latest version?

Just do a git rebase!

    cd ~/.vim_runtime
    git pull --rebase

### Normal mode mappings

Fast saving of a buffer (`<leader>w`):

	nmap <leader>w :w!<cr>
	
Map `<Space>` to `/` (search) and `<Ctrl>+<Space>` to `?` (backwards search):
	
	map <space> /
	map <c-space> ?
	map <silent> <leader><cr> :noh<cr>

Disable highlights when you press `<leader><cr>`:
	
	map <silent> <leader><cr> :noh<cr>

Smart way to move between windows (`<ctrl>j` etc.):
	
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l

Closing of the current buffer(s) (`<leader>bd` and (`<leader>ba`)):
	
	" Close current buffer
	map <leader>bd :Bclose<cr>
	
	" Close all buffers
	map <leader>ba :1,1000 bd!<cr>
	
Useful mappings for managing tabs:
	
	map <leader>tn :tabnew<cr>
	map <leader>to :tabonly<cr>
	map <leader>tc :tabclose<cr>
	map <leader>tm :tabmove 
	
	" Opens a new tab with the current buffer's path
	" Super useful when editing files in the same directory
	map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
	
Switch [CWD](http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file) to the directory of the open buffer:
	
	map <leader>cd :cd %:p:h<cr>:pwd<cr>
	
Open `ack.vim` for fast search:
	
	map <leader>g :Ack 

Quickly open a buffer for scripbble:
	
	map <leader>q :e ~/buffer<cr>

Toggle paste mode on and off:
	
	map <leader>pp :setlocal paste!<cr>


### Visual mode mappings

Visual mode pressing `*` or `#` searches for the current selection:

	vnoremap <silent> * :call VisualSelection('f')<CR>
	vnoremap <silent> # :call VisualSelection('b')<CR>

When you press gv you `Ack.vim` after the selected text:

	vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

When you press `<leader>r` you can search and replace the selected text:

	vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

Surround the visual selection in parenthesis/brackets/etc.:

    vnoremap $1 <esc>`>a)<esc>`<i(<esc>
    vnoremap $2 <esc>`>a]<esc>`<i[<esc>
    vnoremap $3 <esc>`>a}<esc>`<i{<esc>
    vnoremap $$ <esc>`>a"<esc>`<i"<esc>
    vnoremap $q <esc>`>a'<esc>`<i'<esc>
    vnoremap $e <esc>`>a"<esc>`<i"<esc>


### Insert mode mappings

Quickly insert parenthesis/brackets/etc.:

    inoremap $1 ()<esc>i
    inoremap $2 []<esc>i
    inoremap $3 {}<esc>i
    inoremap $4 {<esc>o}<esc>O
    inoremap $q ''<esc>i
    inoremap $e ""<esc>i
    inoremap $t <><esc>i

Insert the current date and time (useful for timestamps):

    iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


### Command line mappings

$q is super useful when browsing on the command line. It deletes everything until the last slash:

    cno $q <C-\>eDeleteTillSlash()<cr>

Bash like keys for the command line:

    cnoremap <C-A>		<Home>
    cnoremap <C-E>		<End>
    cnoremap <C-K>		<C-U>

    cnoremap <C-P> <Up>
    cnoremap <C-N> <Down>

Write the file as sudo (works only on Unix). Super useful when you open a file and you don't have permissions to save your changes. [Vim tip](http://vim.wikia.com/wiki/Su-write):

    :W 


### Spell checking
Pressing `<leader>ss` will toggle spell checking:

    map <leader>ss :setlocal spell!<cr>

Shortcuts using `<leader>` instead of special characters:

    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=


### Cope
Query `:help cope` if you are unsure what cope is. It's super useful!

When you search with `Ack.vim`, display your results in cope by doing:
`<leader>cc`

To go to the next search result do:
`<leader>n`

To go to the previous search results do:
`<leader>p`

Cope mappings:

    map <leader>cc :botright cope<cr>
    map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
    map <leader>n :cn<cr>
    map <leader>p :cp<cr>


## How to uninstall
Just do following:
* Remove `~/.vim_runtime`
* Remove any lines that reference `.vim_runtime` in your `~/.vimrc`

## Inspiration
* [https://github.com/amix/vimrc](https://github.com/amix/vimrc)