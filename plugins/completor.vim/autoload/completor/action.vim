let s:freezed_status = {'pos': [], 'nr': -1, 'ft': '', 'mode': ''}
let s:action = ''
let s:completions = []

let s:DOC_POSITION = {
      \ 'bottom': 'rightbelow',
      \ 'top': 'topleft',
      \ }


function! s:reset()
  let s:completions = []
  if exists('s:job') && completor#compat#job_status(s:job) ==# 'run'
    call completor#compat#job_stop(s:job)
  endif
endfunction


function! completor#action#_on_complete_done()
  if pumvisible() == 0
    try
      pclose
    catch
    endtry
  endif
endfunction


function! completor#action#_on_insert_enter()
  if !exists('s:cot')
    " Record cot.
    let s:cot = &cot
  endif
  let &cot = get(g:, 'completor_complete_options', &cot)
endfunction


function! completor#action#_on_insert_leave()
  if exists('s:cot')
    " Restore cot.
    let &cot = s:cot
  endif
endfunction


function! s:trigger_complete(msg)
  let s:completions = completor#utils#on_data('complete', a:msg)
  if empty(s:completions) | return | endif
  let startcol = completor#action#completefunc(1, '')
  let matches = completor#action#completefunc(0, '')
  if startcol >= 0
    try
      call complete(startcol + 1, matches.words)
    catch /E785\|E685/
    endtry
  endif
endfunction


function! s:jump(items)
  let tmp = tempname()
  let name = ''
  let content = []
  for item in a:items
    if !has_key(item, 'filename')
      continue
    endif
    if empty(name)
      let name = item.name
    endif
    let spec = printf('call cursor(%d, %d)', item.lnum, item.col)
    let tag = item.name."\t".item.filename."\t".spec
    call add(content, tag)
  endfor
  if empty(name)
    return
  endif

  " Split window if the target is not the current file.
  if item.filename != fnamemodify(expand('%'), ':p')
    if g:completor_def_split ==? 'split'
      split
    elseif g:completor_def_split ==? 'vsplit'
      vsplit
    elseif g:completor_def_split ==? 'tab'
      tab split
    endif
  endif

  call writefile(content, tmp)
  let tags = &tags
  let wildignore = &wildignore
  let action = len(content) == 1 ? 'tjump' : 'tselect'
  try
    set wildignore=
    let &tags = tmp
    try
      exe action . ' ' . escape(name, '"')
    catch /E426/
      return
    endtry
    redraw
  finally
    let &tags = tags
    let &wildignore = wildignore
  endtry
endfunction


function! s:goto_definition(msg)
  let items = completor#utils#on_data('definition', a:msg)
  if len(items) > 0
    try
      call s:jump(items)
    catch /E37/
      echohl ErrorMsg
      echomsg '`hidden` should be set (set hidden)'
      echohl NONE
      return
    endtry
  endif
endfunction


function! s:call_signatures(msg)
  let items = completor#utils#on_data('signature', a:msg)

  hi def CompletorCallCurrentArg term=bold,underline cterm=bold,underline

  if empty(items)
    return
  endif
  let item = items[0]
  if !empty(item.params)
    let prefix = item.index == 0 ? [] : item.params[:item.index - 1]
    let suffix = item.params[item.index + 1:]
    let current = item.params[item.index]
  else
    let [prefix, suffix] = [[], []]
    let current = ''
  endif
  echohl Function | echon item.func | echohl None
  echon '(' join(prefix, ', ')
  if !empty(prefix)
    echon ', '
  endif
  echohl CompletorCallCurrentArg | echon current | echohl None
  if !empty(suffix)
    echon ', '
  endif
  echon join(suffix, ', ') ')'
endfunction


function! s:open_doc_window()
  let n = bufnr('__doc__')
  let direction = get(s:DOC_POSITION, g:completor_doc_position, s:DOC_POSITION.bottom)
  if n > 0
    let i = index(tabpagebuflist(tabpagenr()), n)
    if i >= 0
      " Just jump to the doc window
      silent execute (i + 1).'wincmd w'
    else
      silent execute direction.' sbuffer '.n
    endif
  else
    silent execute direction.' split __doc__'
  endif
endfunction


function! s:show_doc(msg)
  let items = completor#utils#on_data('doc', a:msg)
  if empty(items)
    return
  endif
  let doc = split(items[0], "\n")
  if empty(doc)
    return
  endif
  call s:open_doc_window()

  setlocal modifiable noswapfile buftype=nofile
  silent normal! ggdG
  silent $put=doc
  silent normal! 1Gdd
  setlocal nomodifiable nomodified foldlevel=200
  nnoremap <buffer> q ZQ
endfunction


function! s:is_status_consistent()
  return s:freezed_status.pos == getcurpos() &&
        \ s:freezed_status.nr == bufnr('') &&
        \ s:freezed_status.ft == &ft &&
        \ s:freezed_status.mode == mode()
endfunction


function! completor#action#callback(msg)
  if !s:is_status_consistent()
    let s:completions = []
    return
  endif

  if s:action ==# 'complete'
    call s:trigger_complete(a:msg)
  elseif s:action ==# 'definition'
    call s:goto_definition(a:msg)
  elseif s:action ==# 'signature'
    call s:call_signatures(a:msg)
  elseif s:action ==# 'doc'
    call s:show_doc(a:msg)
  elseif s:action ==# 'format'
    silent edit!
  endif
endfunction


function! completor#action#completefunc(findstart, base)
  if a:findstart
    if empty(s:completions)
      return -2
    endif
    return completor#utils#get_start_column()
  endif
  try
    let ret = {'words': s:completions}
    if g:completor_refresh_always
      let ret.refresh = 'always'
    endif
    return ret
  finally
    let s:completions = []
  endtry
endfunction


" :param info: must contain keys: 'cmd', 'ftype', 'is_sync', 'is_daemon'
function! completor#action#do(action, info, status)
  let s:freezed_status = a:status

  if empty(a:info)
    return v:false
  endif

  call s:reset()
  let s:action = a:action
  let options = get(a:info, 'options', {})
  let input_content = get(a:info, 'input_content', '')

  if a:info.is_sync
    call completor#action#callback(a:status.input)
    return v:true
  elseif !empty(a:info.cmd)
    if a:info.is_daemon
      return completor#daemon#process(a:action, a:info.cmd, a:info.ftype, options)
    endif
    let sending_content = !empty(input_content)
    let s:job = completor#compat#job_start_oneshot(a:info.cmd, options, sending_content)
    if completor#compat#job_status(s:job) ==# 'run'
      if sending_content
        call completor#compat#job_send(s:job, input_content)
      endif
      return v:true
    endif
  endif
  return v:false
endfunction


function! completor#action#current_status()
  let e = col('.') - 2
  let inputted = e >= 0 ? getline('.')[:e] : ''
  return {
        \ 'pos': getcurpos(),
        \ 'input': inputted,
        \ 'nr': bufnr(''),
        \ 'ft': &ft,
        \ 'mode': mode(),
        \ }
endfunction
