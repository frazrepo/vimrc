"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       frazrepo
"       https://github.com/frazrepo/vimrc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => ALE linting plugin, disable by default
""""""""""""""""""""""""""""""
let g:ale_enabled = 0

""""""""""""""""""""""""""""""
" => FZF MRU plugin
""""""""""""""""""""""""""""""
nnoremap <silent> <leader>u :FZFMru<CR>
" Uncomment to list only files within the current directory
" let g:fzf_mru_relative = 1

""""""""""""""""""""""""""""""
" => fzf plugin
""""""""""""""""""""""""""""""
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf map to CTRL-T (like Resharper) / CTRL+P
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
nnoremap <silent> <c-t> :Files <C-R>=expand('%:h')<CR><CR>
nnoremap <silent> <c-p> :Files <C-R>=expand('%:h')<CR><CR>
nnoremap <silent> <leader>bb :Buffers<CR>
" To ignore git files
" Add this to ENV
" FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF Ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>

function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Ag' selection
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlSF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
let g:ctrlsf_populate_qflist = 1

nnoremap <silent> <leader>f :call SearchWordWithCtrlSf()<CR>
vnoremap <silent> <leader>f :call SearchVisualSelectionWithCtrlSf()<CR>

function! SearchWordWithCtrlSf()
   execute 'CtrlSF' expand('<cword>')
endfunction

function! SearchVisualSelectionWithCtrlSf() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'CtrlSF' selection
 endfunction
  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
let g:NERDTreeWinPos = "left"
let g:NERDTreeQuitOnOpen= 1
" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store' ]
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>
" Store the bookmarks file
let NERDTreeBookmarksFile=expand("~/.vim/NERDTreeBookmarks")
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
" Close vim when the last window is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show on multiple screen not on single screen
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
      \   'lineinfo': '%3l:%-2c',
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': " ", 'right': " " },
      \ 'subseparator': { 'left': " ", 'right': " " } 
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-rainbow brackets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
" Set this to 1 if you want to activate by default  , or active by typing the :RainbowToggle command
let g:rainbow_active = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ultisnips and vim-snippets configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:UltiSnipsListSnippets ="<c-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Add custom directories for snippets
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim_runtime/plugins/vim-snippets/UltiSnips', $HOME.'/.vim_runtime/plugins/frazrepo-snippets']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim unimpaired (> and < conflict with visual indentation)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
nmap ( [
nmap ) ]
omap ( [
omap ) ]
xmap ( [
xmap ) ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Goyo and zenroom2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
" Default 80%
let g:goyo_width=100
" Default 85%
let g:goyo_height=90
" Toggle
nnoremap <silent> <leader>z :Goyo<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Emmet plugin remap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:user_emmet_leader_key='<tab>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctrlsf Side Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:ctrlsf_auto_close = {
    \ "normal" : 0,
    \ "compact": 0
    \}
    
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_default_view_mode = 'compact'

nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nnoremap <F9> :CtrlSFToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:vim_markdown_folding_disabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack.vim to use ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
if executable('ag') 
    let g:ackprg = 'ag --vimgrep' 
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Wipeout
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
map <leader>bw :Wipeout<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-schlep to drag in visual mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-operator-replace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
nmap gr <Plug>(operator-replace)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-cool
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:CoolTotalMatches = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-signature for easier marks navigation on azerty keyboard 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
map (' ['
map )' ]'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-yankstack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:yankstack_map_keys = 0
nmap ,p <Plug>yankstack_substitute_older_paste
nmap ,n <Plug>yankstack_substitute_newer_paste
nnoremap <silent> <F3> :Yanks<cr>
inoremap <silent> <F3> <ESC>:Yanks<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-autopairs workarounf for â, î and û
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:AutoPairsShortcutBackInsert=''
let g:AutoPairsShortcutJump=''
let g:AutoPairsMoveCharacter=''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-quickscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-sandwich to simulate surround mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
runtime macros/sandwich/keymap/surround.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-qlist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
nnoremap <leader>i :Ilist<space>
