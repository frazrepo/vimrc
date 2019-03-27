" init.vim configuration using the same package
set runtimepath^=~/.vim_runtime runtimepath+=~/.vim_runtime/after
let &packpath = &runtimepath

" Requirements for Ultisnips on Windows
" do: pip install neovim or pip3 install neovim
if has('win32')
  source ~/_vimrc
else
  source ~/.vimrc
endif