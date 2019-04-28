" Formatprg for html
if executable('html-beautify')
    let &l:formatprg = 'html-beautify -f - -I -s ' . &shiftwidth
endif
