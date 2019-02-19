" vim-autosave - Save you work periodically
" -------------------------------------------------------------
" Version: 0.1
" Maintainer:  frazrepo
" Last Change: 19 Feb 2019

" Init: {{{1
let s:cpo= &cpo
if exists("g:loaded_autosave") || &cp
    finish
endif
set cpo&vim
let g:loaded_autosave = 1

" Configuration variables {{{1
" TODO : generic path for windows/linux
let g:autosave_backup     = "C:\\.vim\\backup\\"

" public interface {{{1
com! AutoSave call <sid>DoSave()

" functions {{{1
func! <sid>DoSave() abort "{{{2
  let bufnr=bufnr('')
  let g:autosave_errors=[]
  for nr in range(1, bufnr('$'))
    call <sid>SaveBuffer(nr)
  endfor
  call <sid>Warning(g:autosave_errors)
endfunc

" Returns the final buffername 
func! <sid>GetNames(bufname) "{{{2
  let filename = fnamemodify(a:bufname, ':t')
  if empty(filename)
    let filename='buffer_'.strftime('%Y%m%d_%H%M').'.txt'
  endif

  return filename
endfunc

func! <sid>IsAnonymousBuffer(bufname) "{{{2
  return true
endfunc

func! <sid>SaveBuffer(nr) abort "{{{2
  if !bufexists(a:nr)
    return
  endif
  " don't try to save special buffers (help)
  " unmodified files or buffers without a name
  " or buffers, for which the buffer-local variable
  " 'autosave_disabled' has been set
  if !getbufvar(a:nr, '&modified') ||
  \  !empty(getbufvar(a:nr, '&buftype')) 
      return
  endif
  let saved=0
  let bufname = bufname(a:nr + 0)
  "save to autosave_backup
  let dir = g:autosave_backup
  let filename = s:GetNames(bufname)
  if !isdirectory(dir)
    return
  endif
  try
    let cnt = getbufline(a:nr, 1, '$')
    let name = dir. '/'. fnameescape(filename)
    let win = bufwinnr(a:nr)
    execute win . 'w '.name

    let saved=1
  catch
    echomsg printf("Error  on %s", name)
  endtry
  if !saved
    call add(g:autosave_errors, filename)
  endif
endfunc

func! <sid>MessOut(msg) abort "{{{2
  echohl WarningMsg
  if type(a:msg) == type([])
    for item in a:msg | unsilent echomsg item | endfor
  else
    unsilent echomsg a:msg
  endif
  echohl Normal
endfunc

func! <sid>Warning(list) abort "{{{2
  if empty(a:list)
    return
  endif
  let list = ["AutoSave: The following files could not be written."] + a:list
  <sid>MessOut(list)
	sleep 1
	let v:errmsg = list[0]
endfunc

" Restore: "{{{1
let &cpo=s:cpo
unlet s:cpo
" vim: ts=2 sts=2 sw=2 et fdm=marker com+=l\:\"
