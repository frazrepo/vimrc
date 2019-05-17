let s:daemon = {'msgs': [], 'requested': v:false, 't': 0}


function! s:vim_daemon_handler(msg)
  call completor#action#stream(a:msg)
endfunction


function! s:nvim_daemon_handler(job_id, data, event)
  call completor#action#stream(join(a:data, "\n"))
endfunction


if has('nvim')
  " neovim
  function! s:job_start_daemon(cmd, options)
    let conf = {
          \   'on_stdout': function('s:nvim_daemon_handler'),
          \ }
    call extend(conf, a:options)
    return jobstart(a:cmd, conf)
  endfunction

  function! s:daemon.write(data)
    let s:nvim_last_msg = ''
    try
      call jobsend(self.job, a:data)
    catch /E900/
    endtry
  endfunction
else
  " vim8
  function! s:job_start_daemon(cmd, options)
    let conf = {
          \   'out_cb': {c,m->s:vim_daemon_handler(m)},
          \   'err_io': 'null',
          \   'mode': 'raw',
          \ }
    call extend(conf, a:options)
    return job_start(a:cmd, conf)
  endfunction

  function! s:daemon.write(data)
    try
      call ch_sendraw(job_getchannel(self.job), a:data)
    catch /E631/
      call self.kill()
    endtry
  endfunction
endif


function! s:daemon.respawn(cmd, name, options)
  if self.status(a:name) ==# 'run'
    call completor#compat#job_stop(self.job)
  endif
  let self.job = s:job_start_daemon(a:cmd, a:options)
  call completor#utils#reset()
  let self.type = a:name
  let self.cmd = a:cmd
  let self.requested = v:false
  let self.t = localtime()
endfunction


function! s:daemon.status(name)
  if !exists('self.job')
    return 'none'
  endif
  let s = completor#compat#job_status(self.job)
  if exists('self.type') && self.type != a:name
    if s ==# 'run'
      call completor#compat#job_stop(self.job)
      let s = completor#compat#job_status(self.job)
    endif
    return 'none'
  endif
  return s
endfunction


function s:daemon.kill()
  if exists('self.job') && completor#compat#job_status(self.job) ==# 'run'
    let self.requested = v:false
    call completor#compat#job_stop(self.job, 'kill')
  endif
endfunction


function! completor#daemon#process(action, cmd, name, options, args)
  let s:daemon.msgs = []

  " Daemon not running
  if s:daemon.status(a:name) !=# 'run'
    call s:daemon.respawn(a:cmd, a:name, a:options)
  endif

  if s:daemon.status(a:name) !=# 'run'
    return v:false
  endif

  let req = completor#utils#gen_request(a:action, a:args)
  if empty(req)
    return v:false
  endif

  if type(req) == v:t_list
    for d in req
      call s:daemon.write(d)
    endfor
  else
    call s:daemon.write(req)
  endif

  let s:daemon.requested = v:true
  let s:daemon.t = localtime()
  return v:true
endfunction


function! s:check_status()
  if s:daemon.status(s:daemon.type) !=# 'run'
    echo 'Daemon killed'
  endif
endfunction


function! completor#daemon#kill()
  if has_key(s:daemon, 'type')
    call s:daemon.kill()
    call timer_start(300, {t->s:check_status()})
  else
    echo 'Daemon killed.'
  endif
endfunction
