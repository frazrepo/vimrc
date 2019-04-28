" Formatprg for json using jq
if executable('jq')
    let &l:formatprg = 'jq . --indent ' . &shiftwidth
endif
