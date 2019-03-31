"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       frazrepo
"       https://github.com/frazrepo/vimrc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => ALE linting plugin, disable by default {{{1
""""""""""""""""""""""""""""""
let g:ale_enabled = 0

""""""""""""""""""""""""""""""
" => FZF MRU plugin {{{1
""""""""""""""""""""""""""""""
nnoremap <silent> <leader>u :FZFMru<CR>
" Uncomment to list only files within the current directory
" let g:fzf_mru_relative = 1

""""""""""""""""""""""""""""""
" => FZF plugin {{{1
""""""""""""""""""""""""""""""
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Customize FZF colors to match your color scheme
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
" => FZF map to CTRL-T (like Resharper) / CTRL+P {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
nnoremap <silent> <c-t> :Files <C-R>=expand('%:h')<CR><CR>
nnoremap <silent> <c-p> :Files <C-R>=expand('%:h')<CR><CR>
nnoremap <silent> <leader>bb :Buffers<CR>
nnoremap <silent> <leader>t :Tags<CR>
" To ignore git files
" Add this to ENV
" FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF Ag {{{1
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
" => NerdTree {{{1
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
" => Lightline {{{1
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
" => vim-rainbow brackets {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
" Set this to 1 if you want to activate by default  , or active by typing the :RainbowToggle command
let g:rainbow_active = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ultisnips and vim-snippets configuration {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:UltiSnipsListSnippets ="<c-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Add custom directories for snippets
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim_runtime/plugins/vim-snippets/UltiSnips', $HOME.'/.vim_runtime/plugins/frazrepo-snippets']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim unimpaired (> and < conflict with visual indentation) {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
nmap ( [
nmap ) ]
omap ( [
omap ) ]
xmap ( [
xmap ) ]

" Remap original sentence motion to []
nnoremap [ (
nnoremap ] )

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Goyo and zenroom2 {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
" Default 80%
let g:goyo_width=100
" Default 85%
let g:goyo_height=90
" Toggle
nnoremap <silent> <leader>z :Goyo<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Emmet plugin remap {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:user_emmet_leader_key='<tab>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CTRLSF Side Search {{{1
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
" => CtrlSF Quick Search {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
let g:ctrlsf_populate_qflist = 1

nnoremap <silent> <leader>F :call SearchWordWithCtrlSf()<CR>
vnoremap <silent> <leader>F :call SearchVisualSelectionWithCtrlSf()<CR>

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
" => vim-markdown {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:vim_markdown_folding_disabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack.vim to use ag {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
if executable('ag') 
    let g:ackprg = 'ag --vimgrep' 
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Wipeout {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
map <leader>bw :Wipeout<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-schlep to drag in visual mode {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-operator-replace {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
nmap gr <Plug>(operator-replace)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-cool {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:CoolTotalMatches = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-signature for easier marks navigation on azerty keyboard  {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
map (' ['
map )' ]'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-yankstack {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:yankstack_map_keys = 0
nmap !p <Plug>yankstack_substitute_older_paste
nmap !n <Plug>yankstack_substitute_newer_paste
nnoremap <silent> <F3> :Yanks<cr>
inoremap <silent> <F3> <ESC>:Yanks<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-autopairs workarounf for â, î and û {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:AutoPairsShortcutBackInsert=''
let g:AutoPairsShortcutJump=''
let g:AutoPairsMoveCharacter=''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-quickscope {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-sandwich to simulate surround mappings {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
runtime macros/sandwich/keymap/surround.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-qlist {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
nnoremap <leader>i :Ilist<space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-over {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:over#command_line#substitute#replace_pattern_visually = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar  {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
if executable('ctags')
  nmap <F11> :TagbarToggle<CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Modeline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: fdm=marker
