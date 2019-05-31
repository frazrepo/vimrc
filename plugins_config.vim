"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: frazrepo
" https://github.com/frazrepo/vimrc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF map {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
let g:Lf_RootMarkers = ['.git', '.hg', '.svn', '.project', '.root']
let g:Lf_WildIgnore  = {
    \ 'dir' : ['.git', '.hg', '.svn', 'bin', 'obj', 'packages','android-studio','node_modules'],
    \ 'file': ['*.sw?', '~$*', '*.bak', '*.exe','*.jar', '*.dll', '*.png', '*.map', '*.o', '*.so', '*.py[co]','*tags*'],
    \ }

let g:Lf_CacheDirectory = expand('~/.cache')
if !isdirectory(g:Lf_CacheDirectory)
    silent! call mkdir(g:Lf_CacheDirectory, 'p')
endif

let g:Lf_MruMaxFiles = 200
let g:Lf_MaxCount    = 0

let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}

"Files
let g:Lf_ShortcutF = '<C-P>'

"Buffers
let g:Lf_ShortcutB = '<leader>,'

nnoremap <silent> <leader>;  :LeaderfLine<CR>
nnoremap <silent> <leader>t  :LeaderfTag<CR>
nnoremap <silent> <leader>co :LeaderfHistoryCmd<CR>
nnoremap <silent> <leader>u  :LeaderfMru<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Dirvish {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
map <leader>v :Dirvish<cr>

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
" Set this to 1 if you want to activate by default  
" , or active by typing the :RainbowToggle command
let g:rainbow_active = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ultisnips and vim-snippets configuration {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Add custom directories for snippets
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim_runtime/plugins/vim-snippets/UltiSnips']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim unimpaired  {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
" (> and < conflict with visual indentation)
nmap ( [
nmap ) ]
omap ( [
omap ) ]
xmap ( [
xmap ) ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Emmet plugin remap {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
" Default leader <C-y> 
let g:user_emmet_leader_key=','

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CTRLSF Side Search {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:ctrlsf_auto_close = {
    \ "normal" : 0,
    \ "compact": 0
    \}
    
let g:ctrlsf_default_view_mode = 'compact'

nmap     <leader>/ <Plug>CtrlSFPrompt
vmap     <leader>/ <Plug>CtrlSFVwordPath
nnoremap <F9> :CtrlSFToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlSF Quick Search {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
let g:ctrlsf_populate_qflist = 1
let g:ctrlsf_ignore_dir = ['tags','node_modules']

nnoremap <silent> <leader>* :call SearchWordWithCtrlSf()<CR>
vnoremap <silent> <leader>* :call SearchVisualSelectionWithCtrlSf()<CR>

function! SearchWordWithCtrlSf()
   execute 'CtrlSF ' . expand('<cword>') . ' **/*'
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
    execute 'CtrlSF ' . selection  . ' **/*'
 endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-markdown {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:vim_markdown_folding_disabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-schlep to drag in visual mode {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
vmap  <up>    <Plug>SchleppUp
vmap  <down>  <Plug>SchleppDown
vmap  <left>  <Plug>SchleppLeft
vmap  <right> <Plug>SchleppRight

vmap D <Plug>SchleppDup

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => pear-tree {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
"Toggle with Alt-P mapping
let g:peartree_is_enable=1
function! TogglePearTree()
  if g:peartree_is_enable
    PearTreeDisable
    let g:peartree_is_enable=0
  else
    PearTreeEnable
    let g:peartree_is_enable=1
  endif
endfunction
nnoremap <buffer> <silent> <M-p> :call TogglePearTree()<CR>
inoremap <buffer> <silent> <M-p> <C-O>:call TogglePearTree()<CR>

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
nnoremap <leader>i :execute 'Ilist ' . expand('<cword>')<CR>
vnoremap <silent> <leader>i :<C-u>call VisualSelection('', '')<CR>:Ilist <C-R>=@/<CR><CR>

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
" => Undotree  {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
nnoremap <F4> :UndotreeToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-move  {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:move_auto_indent = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Completor  {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
fun! TabOrComplete() "{{{
		call UltiSnips#ExpandSnippet()
		if g:ulti_expand_res == 0
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

"LSP Activation (not working ?)
let g:completor_filetype_map = {}
" Enable lsp for go by using gopls
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-rooter  {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:rooter_silent_chdir = 1
let g:rooter_patterns = ['global.json', '.git/']
let g:rooter_change_directory_for_non_project_files = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neoformat  {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
noremap <F3> :Neoformat<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => yankmatches {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:YankMatches#ClipboardRegister='+'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Highlightedyank {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:highlightedyank_highlight_duration = 300

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Scratch {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
nnoremap <leader>bs :Scratch<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Modeline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: fdm=marker
