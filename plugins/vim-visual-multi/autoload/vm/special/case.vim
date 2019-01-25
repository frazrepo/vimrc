"mostly from abolish.vim, with some minor additions
"abolish.vim by Tim Pope <http://tpo.pe/>
"https://github.com/tpope/vim-abolish

fun! vm#special#case#init()
  let s:V       = b:VM_Selection

  let s:X    = { -> g:VM.extend_mode }
  let s:R    = { -> s:V.Regions }

  return s:Case
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:Case = {}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

fun! s:Case.mixed(word) dict
  return substitute(self.camel(a:word),'^.','\u&','')
endfun

fun! s:Case.camel(word) dict
  let word = substitute(a:word,'[.-]','_','g')
  let word = substitute(word,' ','_','g')
  if word !~# '_' && word =~# '\l'
    return substitute(word,'^.','\l&','')
  else
    return substitute(word,'\C\(_\)\=\(.\)','\=submatch(1)==""?tolower(submatch(2)) : toupper(submatch(2))','g')
  endif
endfun

fun! s:Case.snake(word) dict
  let word = substitute(a:word,'::','/','g')
  let word = substitute(word,'\(\u\+\)\(\u\l\)','\1_\2','g')
  let word = substitute(word,'\(\l\|\d\)\(\u\)','\1_\2','g')
  let word = substitute(word,'[.-]','_','g')
  let word = substitute(word,' ','_','g')
  let word = tolower(word)
  return word
endfun

fun! s:Case.snake_upper(word) dict
  return toupper(self.snake(a:word))
endfun

fun! s:Case.dash(word) dict
  return substitute(self.snake(a:word),'_','-','g')
endfun

fun! s:Case.space(word) dict
  return substitute(self.snake(a:word),'_',' ','g')
endfun

fun! s:Case.dot(word) dict
  return substitute(self.snake(a:word),'_','.','g')
endfun

fun! s:Case.title(word) dict
  return substitute(self.space(a:word), '\(\<\w\)','\=toupper(submatch(1))','g')
endfun

fun! s:Case.lower(word) dict
  return tolower(a:word)
endfun

fun! s:Case.upper(word) dict
  return toupper(a:word)
endfun

fun! s:Case.capitalize(word) dict
  return toupper(a:word[0:0]) . tolower(a:word[1:])
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

fun! s:Case.menu() dict
  echohl WarningMsg | echo "\tCase Conversion\n---------------------------------"
  echohl WarningMsg | echo "l         " | echohl Type | echon "lowercase"       | echohl None
  echohl WarningMsg | echo "u         " | echohl Type | echon "UPPERCASE"       | echohl None
  echohl WarningMsg | echo "C         " | echohl Type | echon "Captialize"      | echohl None
  echohl WarningMsg | echo "c         " | echohl Type | echon "camelCase"       | echohl None
  echohl WarningMsg | echo "m         " | echohl Type | echon "MixedCase"       | echohl None
  echohl WarningMsg | echo "s         " | echohl Type | echon "snake_case"      | echohl None
  echohl WarningMsg | echo "S         " | echohl Type | echon "SNAKE_UPPERCASE" | echohl None
  echohl WarningMsg | echo "-         " | echohl Type | echon "dash-case"       | echohl None
  echohl WarningMsg | echo ".         " | echohl Type | echon "dot.case"        | echohl None
  echohl WarningMsg | echo "<space>   " | echohl Type | echon "space case"      | echohl None
  echohl WarningMsg | echo "t         " | echohl Type | echon "Title Case"      | echohl None
  echohl WarningMsg | echo "---------------------------------"
  echohl Directory | echo "Enter an option: " | echohl None
  let c = nr2char(getchar())
  echon c "\t"
  if c ==# "c"
    call self.convert('camel')
  elseif c ==# "m"
    call self.convert('mixed')
  elseif c ==# "s"
    call self.convert('snake')
  elseif c ==# "S"
    call self.convert('snake_upper')
  elseif c ==# "-"
    call self.convert('dash')
  elseif c ==# "k"
    call self.convert('remove')
  elseif c ==# "."
    call self.convert('dot')
  elseif c ==# "\<space>"
    call self.convert('space')
  elseif c ==# "t"
    call self.convert('title')
  elseif c ==# "l"
    call self.convert('lower')
  elseif c ==# "u"
    call self.convert('upper')
  elseif c ==# "C"
    call self.convert('capitalize')
  endif
  call feedkeys("\<cr>", 'n')
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

fun! s:Case.convert(type) dict
  if !len(s:R()) | return | endif
  if !s:X()
    normal siw
  endif

  let text = [] | let g:VM.registers['"'] = text
  for r in s:R()
    call add(text, eval("self.".a:type."(r.txt)"))
  endfor
  normal p
endfun
