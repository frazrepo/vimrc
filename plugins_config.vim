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
" => FZF map {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
nnoremap <silent> <c-p> :Files <C-R>=expand('%:h')<CR><CR>
nnoremap <silent> <leader>bb :Buffers<CR>
nnoremap <silent> <leader>, :Buffers<CR>
nnoremap <silent> <leader>t :Tags<CR>
" To ignore git files
" Add this to ENV
" FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

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
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
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
" Default leader <C-y> 
" Performance pbm when setting tab or <C-j> (ultisnips map)
let g:user_emmet_leader_key=','

" Working tab completion mapping for emmet
" Todo :integration with ultisnips and vim completor
" let g:user_emmet_expandabbr_key='<Tab>'
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

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
nmap     <C-F>b :CtrlSF  %<Left><Left>
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nnoremap <F9> :CtrlSFToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlSF Quick Search {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
let g:ctrlsf_populate_qflist = 1
let g:ctrlsf_ignore_dir = ['tags']

nnoremap <silent> K :call SearchWordWithCtrlSf()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithCtrlSf()<CR>

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
" => Wipeout {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
map <leader>bw :Wipeout<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-schlep to drag in visual mode {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
vmap  <up>    <Plug>SchleppUp
vmap  <down>  <Plug>SchleppDown
vmap  <left>  <Plug>SchleppLeft
vmap  <right> <Plug>SchleppRight

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-operator-replace {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
nmap gr <Plug>(operator-replace)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-signature for easier marks navigation on azerty keyboard  {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
map (' ['
map )' ]'

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
" => Completor  {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     

function! s:IsEmmetInstalled()
  return hasmapto('<plug>(emmet-move-next)', 'i') &&
        \ hasmapto('<plug>(emmet-move-prev)', 'i') &&
        \ hasmapto('<plug>(emmet-expand-abbr)', 'i')
endfunction

fun! TabOrComplete() "{{{
		call UltiSnips#ExpandSnippet()
		if g:ulti_expand_res == 0
      if s:IsEmmetInstalled()
        if emmet#isExpandable()
            " Todo : Not working correctly, expand only the last one
            call feedkeys(",,")
            return ""
        endif
      endif
			if pumvisible()
				return "\<C-n>"
			else
				call UltiSnips#JumpForwards()
				if g:ulti_jump_forwards_res == 0
					" If completor is not open and we are in the middle of typing a word then
					" `tab` opens completor menu.
					let inp_str = strpart( getline('.'), col('.')-3, 2 )
					if col('.')>1 && (inp_str =~ '^\w$' || inp_str =~ '\%(->\)\|\%(.\w\)\|\%(\w\.\)\|\%(./\)')
						return "\<C-R>=completor#do('complete')\<CR>"
            " Uncomment here to return to vanilla completion
            " return "\<C-n>"
					else
						return "\<TAB>"
					endif
				endif
			endif
		endif
		return ""
	endf "}}}
	au InsertEnter * exec "inoremap <silent> <Tab> <C-R>=TabOrComplete()<cr>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-rooter  {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:rooter_patterns = ['.vimroot', '.git/', '.python-version']
augroup vimrc_rooter
    autocmd!
    autocmd VimEnter * :Rooter
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-autoformat to use gq command  {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
function! AutoFormat()
  :Autoformat
endfunction

" For SQL
au FileType sql setlocal formatexpr=AutoFormat()

noremap <F3> :Autoformat<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => netrw configuration {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:netrw_banner=0
let g:netrw_winsize=15
let g:netrw_liststyle=3

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Modeline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: fdm=marker
