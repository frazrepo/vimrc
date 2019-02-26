" vim-rotatescheme - Rotate a list of ColorSchemes
" Author:       frazrepo
" Version:      0.1

if v:version < 700 || exists('loaded_rotatescheme') || &cp
  finish
endif

let loaded_rotatescheme = 1

let s:choices = ['afterglow', 'anderson', 'ayu', 'atom-dark-256', 'codedark', 'dracula' ,'molokai' ,'monokai', 'PaperColor', 'pencil', 'seoul256-light', 'seoul256', 'space-vim-dark']

function! RotateColorScheme(forward)
  let index = exists('g:colors_name') ? index(s:choices, g:colors_name) : 0

  if (a:forward > 0)
    let index = ( index + 1 ) % len(s:choices)
  else
    let index = ( index ? index :  len(s:choices)) -1
  endif
  
  "Update colorscheme
  execute "colorscheme " . s:choices[index]

  " show current name on screen. :h :echo-redraw
  redraw
  execute "colorscheme"
endfunction

map <F10>         :call RotateColorScheme(1)<CR>
imap <F10>   <Esc>:call RotateColorScheme(1)<CR>

map <S-F10>       :call RotateColorScheme(-1)<CR>
imap <S-F10> <Esc>:call RotateColorScheme(-1)<CR>