"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: autoload utility functions
"       frazrepo
"       https://github.com/frazrepo/vimrc
"
" Debug : vim --startuptime vim.log
"
" To start vim without using this .vimrc file, use:
"     vim -u NORC
"
" To start vim without loading any .vimrc or plugins, use:
"     vim -u NONE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Check colorScheme
function! frazutils#HasColorscheme(name)
    let pat = 'colors/'.a:name.'.vim'
    return !empty(globpath(&rtp, pat))
endfunction