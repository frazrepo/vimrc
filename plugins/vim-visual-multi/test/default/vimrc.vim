" needed by vimrunner
function! VimrunnerPyEvaluateCommandOutput(command)
  redir => output
    silent exe a:command
  redir END
  return output
endfunction

set runtimepath^=..
set nocompatible
let g:VM_leader = ','
