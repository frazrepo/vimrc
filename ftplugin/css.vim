" Formatprg for css
if executable('css-beautify')
    let &l:formatprg = 'css-beautify -f - -s ' . &shiftwidth
endif