"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: frazrepo
" https://github.com/frazrepo/vimrc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF map {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
let g:Lf_RootMarkers = ['.git', '.hg', '.svn', '.project', '.root']
let g:Lf_WorkingDirectoryMode = 'Ac'
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
" Do not show icons, icons are shown by default
let g:Lf_ShowDevIcons = 0

" Refresh cache after restart , default = 1
let g:Lf_UseCache=0

let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}

"Files
let g:Lf_ShortcutF = '<C-P>'

"Buffers
let g:Lf_ShortcutB = '<leader>,'

nnoremap <silent> <leader>ff :LeaderfFile<CR>
nnoremap <silent> <leader><leader>  :LeaderfFile<CR>
nnoremap <silent> <leader>;  :LeaderfLine<CR>
nnoremap <silent> <leader>sc :LeaderfHistoryCmd<CR>
nnoremap <silent> <leader>u  :LeaderfMru<CR>
nnoremap <silent> <leader>fr  :LeaderfMru<CR>

" popup mode
let g:Lf_WindowPosition = 'popup'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lightline {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show on multiple screen not on single screen
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'column' ], [ 'mylineinfo' ], [ 'filetype' ] ]
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
      \   'column': '%2c ',
      \   'mylineinfo': "%{printf('%03d/%03d', line('.'),  line('$'))}",
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
"Fixing bug on markdown files, not working when opening the second time
let g:UltiSnipsExpandTrigger='<C-j>'

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
let g:user_emmet_leader_key = ','

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-grepper search {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:grepper={}
let g:grepper.tools=["rg", "git"]

nmap     <leader>/ :GrepperRg<Space>
vmap     <leader>/ "sy:GrepperRg -F '<C-r>s'<Space>
vmap     <leader>gr <plug>(GrepperOperator)

nnoremap <Leader>* :Grepper -cword -noprompt<CR>

xmap <Leader>*
    \ "sy
    \ gv<Leader>gr

" Project wide find and replace. It's similar to <leader>r but applies to all matches
" across all files.
nnoremap <Leader>R
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Visual Selection Variant
xmap <Leader>R
    \ "sy
    \ gv<Leader>gr
    \ :cfdo %s/<C-r>s//g \| update
     \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-markdown {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:vim_markdown_folding_disabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""	
" => Vim-autopairs workarounf for â, î and û {{{1	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     	
"Toggle with Alt-P mapping	
let g:AutoPairsShortcutBackInsert=''	
let g:AutoPairsShortcutJump=''	
let g:AutoPairsMoveCharacter=''	

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-sandwich to simulate surround mappings {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
runtime macros/sandwich/keymap/surround.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-over {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:over#command_line#substitute#replace_pattern_visually = 1

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
" => Highlightedyank {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
let g:highlightedyank_highlight_duration = 300

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive  {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
nnoremap <leader>gg :Git<cr>
nnoremap <leader>gs :Git status<cr>
nnoremap <leader>gd :Git diff<cr>
nnoremap <leader>gb :Git blame<cr>
nnoremap gdh :diffget //2<cr>
nnoremap gdl :diffget //3<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFind<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tokyonight {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => whichkey {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
" Options
let g:which_key_fallback_to_native_key = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Space whichkey {{{2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
let g:which_key_map = {}
" Direct maps
let g:which_key_map.u = 'Find recent files'
let g:which_key_map.e = 'NerdTree Toggle'
let g:which_key_map.m = 'Replace special char ^m'
let g:which_key_map.n = 'NerdTree find buffer'
let g:which_key_map.q = 'QuickFix Toggle'
let g:which_key_map.R = 'Replace word or selection'
"let g:which_key_map[' '] = 'Find files'
let g:which_key_map['/'] = 'Grep (Root Dir)'
let g:which_key_map['*'] = 'Grep word or selection'
let g:which_key_map[';'] = 'Buffer lines'
let g:which_key_map[','] = 'Find buffers'
let g:which_key_map['-'] = 'Split horizontally'
let g:which_key_map['='] = 'Split vertically'
let g:which_key_map['!'] = 'Buffer delete'
let g:which_key_map['<BS>'] = 'Alternate tab'
" Find
let g:which_key_map.f = {
      \ 'name' : '+find',
      \ }

" Git
let g:which_key_map.g = {
      \ 'name' : '+git',
      \ }

" Buffers"
let g:which_key_map.b = {
      \ 'name' : '+buffers',
      \ 'd' : 'buffer-delete',
      \ 'n' : 'buffer-new',
      \ 'a' : 'buffer-delete-all',
      \ 'o' : 'buffer-only',
      \ '-' : 'buffer-split',
      \ '=' : 'buffer-vsplit',
      \ 'x' : 'buffer-text',
      \ 'm' : 'buffer-markdown',
      \ 's' : 'buffer-sql',
      \ 'e' : 'buffer-new-cwd',
      \ }

" Tab
let g:which_key_map.t = {
      \ 'name' : '+tab',
      \ 'n' : 'tab-new',
      \ 'o' : 'tab-only',
      \ 'c' : 'tab-close',
      \ 'e' : 'tab-new-cwd',
      \ }

" Windows
let g:which_key_map.w = {
      \ 'name' : '+windows',
      \ }

" Search
let g:which_key_map.s = {
      \ 'name' : '+search',
      \ }

" Replace
let g:which_key_map.r = {
      \ 'name' : '+replace',
      \ }

" Code/ Format/ Change
let g:which_key_map.c = {
      \ 'name' : '+code/format/change',
      \ 'd' : 'Change to current buffer directory',
      \ }
call which_key#register('<Space>', 'g:which_key_map')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => g whichkey {{{2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
nnoremap <silent> g :<c-u>WhichKey 'g'<CR>
vnoremap <silent> g :<c-u>WhichKeyVisual 'g'<CR>
let g:g_which_key_map = {}
" Direct maps
let g:g_which_key_map['%'] = 'Macth pair backward'
let g:g_which_key_map['='] = 'Indent buffer'
let g:g_which_key_map['Q'] = 'Format buffer'
let g:g_which_key_map.l = 'Align right'
let g:g_which_key_map.L = 'Align left'
let g:g_which_key_map.c = 'Comment'
let g:g_which_key_map['cc'] = 'Comment line'
let g:g_which_key_map.r = 'Replace operator'
let g:g_which_key_map['rr'] = 'Replace line (with register)'
let g:g_which_key_map.s = 'Sort operator'
let g:g_which_key_map['ss'] = 'Sort lines'
let g:g_which_key_map.V = 'Reselect visual selection'
" Group
let g:g_which_key_map.o = {
      \ 'name' : '+gtfo',
      \ }
" Diff
let g:g_which_key_map.d = {
      \ 'name' : '+diffget',
      \ }
call which_key#register('g', 'g:g_which_key_map')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => c whichkey {{{2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
nnoremap <silent> c :<c-u>WhichKey 'c'<CR>
vnoremap <silent> c :<c-u>WhichKeyVisual 'c'<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Modeline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: fdm=marker
