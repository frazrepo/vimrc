" init.vim configuration using the same package
set runtimepath^=~/.vim_runtime runtimepath+=~/.vim_runtime/after
let &packpath = &runtimepath

"Performance Optimization
if has('win32') || has('win64')
  " let g:python_host_prog = '/usr/bin/python2'
  " let g:python3_host_prog = '/usr/bin/python3'
else
  let g:python_host_prog = '/usr/bin/python2'
  let g:python3_host_prog = '/usr/bin/python3'
endif

" Requirements for Ultisnips on Windows
" do: pip install neovim or pip3 install neovim
if has('win32')
  source ~/_vimrc
else
  source ~/.vimrc
endif


