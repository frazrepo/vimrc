" vim-rotatescheme - Rotate a list of ColorSchemes
" Author:       frazrepo
" Version:      0.2 

if v:version < 700 || exists('loaded_rotatescheme') || &cp
finish
endif

let loaded_rotatescheme = 1

let s:choices = ['anderson', 'ayu', 'apprentice', 'atom-dark-256', 'codedark', 'dracula', 'gruvbox8','monokai','mustang', 'nord' ,'pencil', 'seoul256-light', 'seoul256']

function! RotateColorScheme(forward)
if !exists("g:colors_index")
  let g:colors_index = exists('g:colors_name') ? index(s:choices, g:colors_name) : 0
endif 

if (a:forward > 0)
  let  g:colors_index= (  g:colors_index+ 1 ) % len(s:choices)
else
  let  g:colors_index= (  g:colors_index? g:colors_index: len(s:choices)) -1
endif

"Update colorscheme
execute "colorscheme " . s:choices[g:colors_index]

" show current name on screen. :h :echo-redraw
redraw
execute "colorscheme"
endfunction

" Plug mappings
map <silent> <Plug>(RotateColorSchemeNext) :call RotateColorScheme(1)<CR>
map <silent> <Plug>(RotateColorSchemePrevious) :call RotateColorScheme(-1)<CR>
imap <silent> <Plug>(RotateColorSchemeNext) <ESC>:call RotateColorScheme(1)<CR>
imap <silent> <Plug>(RotateColorSchemePrevious) <ESC>:call RotateColorScheme(-1)<CR>

" Default mappings if not defined : F10 and <S-F10
if !hasmapto('<Plug>(RotateColorSchemeNext)', 'n')
  map <silent><F10>         <Plug>(RotateColorSchemeNext)
endif
if !hasmapto('<Plug>(RotateColorSchemePrevious)', 'n')
  map <silent><S-F10>       <Plug>(RotateColorSchemePrevious)
endif

if !hasmapto('<Plug>(RotateColorSchemeNext)', 'i')
  imap <silent><F10>  <Plug>(RotateColorSchemeNext)
endif

if !hasmapto('<Plug>(RotateColorSchemePrevious)', 'i')
  imap <silent><S-F10> <Plug>(RotateColorSchemePrevious)
endif