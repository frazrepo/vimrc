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

nnoremap <silent> <leader>;  :LeaderfLine<CR>
nnoremap <silent> <leader>co :LeaderfHistoryCmd<CR>
nnoremap <silent> <leader>u  :LeaderfMru<CR>

" popup mode
let g:Lf_WindowPosition = 'popup'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lightline {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show on multiple screen not on single screen
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'wombat',
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
if exists("g:developer_edition") 
  let g:UltiSnipsExpandTrigger='<Nop>'
else
  "Fixing bug on markdown files, not working when opening the second time
  let g:UltiSnipsExpandTrigger='<C-j>'
endif

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
" => vim-qlist {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
nnoremap <silent> <leader>f :execute 'Ilist ' . expand('<cword>')<CR>
vnoremap <silent> <leader>f :<C-u>call VisualSelection('', '')<CR>:Ilist <C-R>=@/<CR><CR>

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
if !exists("g:developer_edition") 
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
endif

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
" => Scratch {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
nnoremap <leader>bs :Scratch<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive  {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap gdh :diffget //2<cr>
nnoremap gdl :diffget //3<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTreer {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""             
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFind<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Modeline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: fdm=marker
